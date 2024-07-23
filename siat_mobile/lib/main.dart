import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:siat_mobile/firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   // await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  requestNotificationPemission();

  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //   }
  // });
  
  await Environment.loadSettings();

  await FlutterDownloader.initialize();

  runApp(const MyApp());
}

class Environment {
  static late Map<String, dynamic> _current;

  static Map<String, dynamic> get current => _current;

  static Future<void> loadSettings() async {
    _current = await _loadSettings();
  }

  static Future<Map<String, dynamic>> _loadSettings() async {
    
    Map<String, dynamic> environment = {};
    
    if (defaultTargetPlatform == TargetPlatform.android) {
      environment = {
        'icon': '@mipmap/testecam',
        'id': 'teste.br.gov.camaragibe',
        'label': 'Teste Camaragibe Conectado',
        'title': 'Camaragibe',
        'uri': 'https://www2.tinus.com.br/csp/TESTECAM/portal/mobile.csp?515vPvr3259WZVxt29581YmXu4618Hb=CWES11JoC574Mej31113SqkVI187raELC6277u4757601Ztti780',
        'version': '1.0',
      };
    }
    
    environment['android'] = await FirebaseMessaging.instance.getToken();
    environment['ios'] = await FirebaseMessaging.instance.getAPNSToken();
    
    return environment;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Environment.current['title'],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: Environment.current['title']),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = webViewController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}

WebViewController webViewController(BuildContext context) {
  WebViewController controller = WebViewController();
  controller.setJavaScriptMode(JavaScriptMode.unrestricted);
  controller.setNavigationDelegate(NavigationDelegate(
    onNavigationRequest: (NavigationRequest request) async {
       if (Uri.parse(Environment.current['uri']).host != Uri.parse(request.url).host) {
          await openExternalURL(context, request);
          return NavigationDecision.prevent;
        }
      if (request.url.endsWith('.pdf')) {
        download(context, request);
        return NavigationDecision.prevent;
      }
      return NavigationDecision.navigate;
    },
    onPageFinished: (String url) async {
      await listenInputFile(context,  controller);
    },
  ));
  controller.addJavaScriptChannel('Print', onMessageReceived: (onMessageReceived) async {
    await upload(context, controller);
  });
  controller.loadRequest(Uri.parse("${Environment.current['uri']}&WVERSION=${Environment.current['version']}&WANDROID=${Environment.current['android']}&&WIOS=${Environment.current['ios']}"));
  return controller;
}

Future<void> permission(BuildContext context, String title, String desc) async {
  await Alert(
    context: context,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        color: Colors.blue,
        onPressed: () async {
          await openAppSettings();
          if(context.mounted){
            Navigator.pop(context);
          }
        },
        child: const Text("Configurações", style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
    ],
  ).show();
}

Future<void> download(BuildContext context, NavigationRequest request) async {
  var status = await Permission.notification.status;

  if (!status.isGranted) {
    status = await Permission.notification.request();

    if (!status.isGranted) {
      if (context.mounted) {
        await permission(
          context,
          "Permissão de Notificação",
          "Para executar downloads"
        );
        status = await Permission.notification.request();
      }
    }
  }

  if (status.isGranted) {
    final directory = await getExternalStorageDirectory();
    final savedDir = directory?.path ?? '';

    await FlutterDownloader.enqueue(
      url: request.url,
      savedDir: savedDir,
    );

  }
}

Future<void> listenInputFile(BuildContext context, WebViewController controller) async {
  controller.runJavaScript('''
    window[0].frameElement.onload = function () {
      if (window[0].document.getElementById('FileStream')){
        window[0].document.getElementById('FileStream').onclick = function() {
          try { Print.postMessage(''); } catch (error) { }
        }
      }
      
      if (window[0].document.getElementById('upload')) {
        window[0].document.getElementById('upload').onload = function () {
          if (window[0][0].document.getElementById('FileStream')) {
            window[0][0].document.getElementById('FileStream').onclick = function() {
              try { Print.postMessage(''); } catch (error) { }
            }
          }
        }
      }
    }
  ''');
}

Future<void> upload(BuildContext context, WebViewController controller) async {

  var status = await Permission.manageExternalStorage.status;

  if (!status.isGranted) {
    status = await Permission.manageExternalStorage.request();

    if (!status.isGranted) {
      if (context.mounted){
        await permission(
          context,
          "Permissão de Armazenamento",
          "Para executar uploads"
        );
        status = await Permission.manageExternalStorage.request();
      }
    }
  }

  if (status.isGranted) {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {

      PlatformFile data = result.files.single;

      File file = File(data.path!);
      
      Uint8List bytes = await file.readAsBytes();

      String content =  base64.encode(bytes);

      controller.runJavaScript('''
        var fileInput = window[0].document.getElementById('FileStream') || window[0][0].document.getElementById('FileStream');
        if (fileInput) {
          var base64Data = '$content';
          var byteCharacters = atob(base64Data); // Decodifica Base64 para uma string de bytes
          var byteNumbers = new Array(byteCharacters.length);
          for (var i = 0; i < byteCharacters.length; i++) {
            byteNumbers[i] = byteCharacters.charCodeAt(i);
          }
          var byteArray = new Uint8Array(byteNumbers);
          var file = new File([byteArray], '${data.name}');
          var dataTransfer = new DataTransfer();
          dataTransfer.items.add(file);
          fileInput.files = dataTransfer.files;
        }
      ''');
    }
  }
}

Future<void> openExternalURL(BuildContext context, NavigationRequest request) async {
  await launchUrl(Uri.parse(request.url));
}

Future<void> requestNotificationPemission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  // print('User granted permission: ${settings.authorizationStatus}');
}
