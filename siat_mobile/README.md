# siat_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Environment Settings

```json

// .vscode\settings.json
{
    "terminal.integrated.defaultProfile.windows": "Git Bash",
    "terminal.integrated.profiles.windows": {
        "Git Bash": {
            "source": "Git Bash",
            "args": ["--rcfile", "${workspaceFolder}/.bash/.bash_profile"],
        }
    },
}

// .vscode\launch.json
{
    // Use o IntelliSense para saber mais sobre os atributos possíveis.
    // Focalizar para exibir as descrições dos atributos existentes.
    // Para obter mais informações, acesse: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "v0\\siat_mobile",
            "cwd": "v0\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v0\\siat_mobile (profile mode)",
            "cwd": "v0\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v0\\siat_mobile (release mode)",
            "cwd": "v0\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "v1\\siat_mobile",
            "cwd": "v1\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v1\\siat_mobile (profile mode)",
            "cwd": "v1\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v1\\siat_mobile (release mode)",
            "cwd": "v1\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "v2\\siat_mobile",
            "cwd": "v2\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v2\\siat_mobile (profile mode)",
            "cwd": "v2\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v2\\siat_mobile (release mode)",
            "cwd": "v2\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "v3\\siat_mobile",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v3\\siat_mobile (profile mode)",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v3\\siat_mobile (release mode)",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "v3\\siat_mobile",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v3\\siat_mobile (profile mode)",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v3\\siat_mobile (release mode)",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "v\\siat_mobile",
            "cwd": "v\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v\\siat_mobile (profile mode)",
            "cwd": "v\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v\\siat_mobile (release mode)",
            "cwd": "v\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        }
    ]
}
```

```sh

# .bash\.bash_profile
PATH="/mingw64/bin:/usr/bin"
PATH="$PATH:/c/Program Files/Git/bin"
PATH="$PATH:/c/Program Files/nodejs"
PATH="$PATH:/c/Users/julio/AppData/Local/Programs/Microsoft VS Code/bin"
PATH="$PATH:/c/Users/julio/AppData/Local/Pub/Cache/bin"
PATH="$PATH:/c/Users/julio/AppData/Roaming/nvm"
PATH="$PATH:/c/Users/julio/AppData/Roaming/npm"
PATH="$PATH:/c/Users/julio/flutter/bin"
source .bash/.bashrc

# .bash\.bash_profile
function environment(){
    for var in $(compgen -v); do
        echo "$var=${!var}"
    done
}

function path(){
    IFS=':'
    for input in $PATH; do
        output=$(cygpath -w "$input")
        echo "$output"
    done
}

function version(){
    echo "code >" 
    code --version 1.91.1 && echo

    echo "firebase >" 
    firebase --version 13.13.3 && echo
    
    echo "flutter >" 
    flutter --version 3.22.2 && echo
    
    echo "flutterfire >" 
    flutterfire --version 1.0.0 && echo
    
    echo "git >" 
    git --version 2.43.0 && echo
    
    echo "node >" 
    node --version 20.11.0 && echo
    
    echo "npm >" 
    npm --version 10.4.0 && echo
    
    echo "nvm >" 
    nvm --version 1.1.12  && echo
}

function android() {

    if [ -z "$1" ]; then
        echo "SETUP <arg>"
        return
    fi

    source $(dirname $PWD)/settings/$1.sh
    
    INPUT_FILE_TEMPLATE=(
        "$PWD/lib/main_template.dart"
        "$PWD/android/app/build_template.gradle"
        "$PWD/android/app/src/main/AndroidManifest_template.xml"
    )

    OUTPUT_FILE=(
        "$PWD/lib/main.dart"
        "$PWD/android/app/build.gradle"
        "$PWD/android/app/src/main/AndroidManifest.xml"
    )

    for INDEX  in "${!INPUT_FILE_TEMPLATE[@]}"; do
        INPUT_FILE_TEMPLATE="${INPUT_FILE_TEMPLATE[INDEX]}"
        OUTPUT_FILE="${OUTPUT_FILE[INDEX]}"
        CONTENT=$(<"$INPUT_FILE_TEMPLATE")
        CONTENT="${CONTENT//\{\{ICON\}\}/${ANDROID[ICON]}}"
        CONTENT="${CONTENT//\{\{ID\}\}/${ANDROID[ID]}}"
        CONTENT="${CONTENT//\{\{LABEL\}\}/${ANDROID[LABEL]}}"
        CONTENT="${CONTENT//\{\{TITLE\}\}/${ANDROID[TITLE]}}"
        CONTENT="${CONTENT//\{\{URI\}\}/${ANDROID[URI]}}"
        echo "$CONTENT" > "$OUTPUT_FILE"
    done
}

# .bash\.bash_profile
declare -A ANDROID=(
    [ICON]="@mipmap/ic_launcher"
    [ID]="com.example.siat_mobile"
    [LABEL]="siat_mobile"
    [TITLE]="Flutter"
    [URI]=""
)
```

# Create Project

https://docs.flutter.dev/get-started/install/windows/mobile

```bash

# siat_mobile
flutter create siat_mobile
cd siat_mobile
```

```gradle

// siat_mobile\android\app\build_template.gradle
defaultConfig {
    // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
    applicationId = "{{ID}}"
    // You can update the following values to match your application needs.
    // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
    minSdk = flutter.minSdkVersion
    targetSdk = flutter.targetSdkVersion
    versionCode = flutterVersionCode.toInteger()
    versionName = flutterVersionName
}
```

```xml

<!-- siat_mobile\android\app\src\main\AndroidManifest_template.xml -->
<application
    android:label="{{LABEL}}"
    android:name="${applicationName}"
    android:icon="{{ICON}}"
    android:usesCleartextTraffic="true">
</application>
```

```dart

// siat_mobile\lib\main_template.dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '{{TITLE}}',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '{{TITLE}}'),
    );
  }
}
```

# Packages

## webview_flutter

https://pub.dev/packages/webview_flutter/install

```bash

# siat_mobile
flutter pub add webview_flutter
```

```xml

<!-- siat_mobile\android\app\src\main\AndroidManifest_template.xml -->
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
</manifest>
```

```dart

// siat_mobile\lib\main_template.dart
import 'package:webview_flutter/webview_flutter.dart';

class _MyHomePageState extends State<MyHomePage> {
  /*
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  */
  
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = webViewController();
  }

  WebViewController webViewController() {
    WebViewController controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse("{{URI}}"));
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /*
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      */
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
```

## permission_handler

https://pub.dev/packages/permission_handler/install

```bash

# siat_mobile
flutter pub add permission_handler
```

## flutter pub add rflutter_alert

https://pub.dev/packages/rflutter_alert/install

```bash

# siat_mobile
flutter pub add permission_handler
flutter pub add rflutter_alert
```

```dart

// siat_mobile\lib\main_template.dart
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class _MyHomePageState extends State<MyHomePage> {
  /*
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  */
  
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = webViewController();
  }

  WebViewController webViewController() {
    WebViewController controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse("{{URI}}"));
    return controller;
  }

  Future<void> permission(String title, String desc) async {
    await Alert(
        context: context,
        title: title,
        desc: desc,
        buttons: [
        DialogButton(
            color: Colors.blue,
            onPressed: () async {
            await openAppSettings(); 
            if(mounted){
              Navigator.pop(context);
            }
            },
            child: const Text("Configurações", style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /*
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      */
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
```

## path_provider

```bash

# siat_mobile
flutter pub add path_provider
```

https://pub.dev/packages/path_provider/install

## flutter_downloader

https://pub.dev/packages/flutter_downloader/install

```bash

# siat_mobile
flutter pub add flutter_downloader
```

```xml

<!-- siat_mobile\android\app\src\main\AndroidManifest_template.xml -->
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
  <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
</manifest>

<application>
  <provider
    android:name="vn.hunghd.flutterdownloader.DownloadedFileProvider"
    android:authorities="${applicationId}.flutter_downloader.provider"
    android:exported="false"
    android:grantUriPermissions="true">
    <meta-data
        android:name="android.support.FILE_PROVIDER_PATHS"
        android:resource="@xml/provider_paths"/>
  </provider>
</application>
```

```dart

// siat_mobile\lib\main_template.dart
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterDownloader.initialize();

  runApp(const MyApp());
}

class _MyHomePageState extends State<MyHomePage> {
  /*
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  */
  
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = webViewController();
  }

  WebViewController webViewController() {
    WebViewController controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.setNavigationDelegate(NavigationDelegate(
      onNavigationRequest: (NavigationRequest request) async {
        if (request.url.endsWith('.pdf')) {
          await download(request);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ));
    controller.loadRequest(Uri.parse("{{URI}}"));
    return controller;
  }

  Future<void> permission(String title, String desc) async {
    await Alert(
        context: context,
        title: title,
        desc: desc,
        buttons: [
        DialogButton(
            color: Colors.blue,
            onPressed: () async {
            await openAppSettings(); 
            if(mounted){
              Navigator.pop(context);
            }
            },
            child: const Text("Configurações", style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        ],
    ).show();
  }

  Future<void> download(NavigationRequest request) async {
    var status = await Permission.notification.status;

    if (!status.isGranted) {
      status = await Permission.notification.request();

      if (!status.isGranted) {
        await permission(
          "Permissão de Notificação",
          "Para executar downloads"
        );
        status = await Permission.notification.request();
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /*
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      */
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
```

## file_picker

https://pub.dev/packages/file_picker/install

```bash

# siat_mobile
flutter pub add file_picker
```

```dart

// siat_mobile\lib\main_template.dart
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class _MyHomePageState extends State<MyHomePage> {
  /*
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  */
  
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = webViewController();
  }

  WebViewController webViewController() {
    WebViewController controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse("{{URI}}"));
   controller.setNavigationDelegate(NavigationDelegate(
      onNavigationRequest: (NavigationRequest request) async {
        if (request.url.endsWith('.pdf')) {
          await download(request);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
      onPageFinished: (String url) async {
        await listenInputFile();
      },
    ));
    controller.addJavaScriptChannel('Print', onMessageReceived: (onMessageReceived) async {
      await upload();
    });
    return controller;
  }

  Future<void> permission(String title, String desc) async {
    await Alert(
        context: context,
        title: title,
        desc: desc,
        buttons: [
        DialogButton(
            color: Colors.blue,
            onPressed: () async {
            await openAppSettings(); 
            if(mounted){
              Navigator.pop(context);
            }
            },
            child: const Text("Configurações", style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        ],
    ).show();
  }

  Future<void> download(NavigationRequest request) async {
    var status = await Permission.notification.status;

    if (!status.isGranted) {
      status = await Permission.notification.request();

      if (!status.isGranted) {
        await permission(
          "Permissão de Notificação",
          "Para executar downloads"
        );
        status = await Permission.notification.request();
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

  Future<void> listenInputFile() async {
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

  Future<void> upload() async {

    var status = await Permission.manageExternalStorage.status;

    if (!status.isGranted) {
      status = await Permission.manageExternalStorage.request();

      if (!status.isGranted) {
        await permission(
          "Permissão de Armazenamento",
          "Para executar uploads"
        );
        status = await Permission.manageExternalStorage.request();
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /*
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      */
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
```

## url_launcher

https://pub.dev/packages/url_launcher/install

```bash

# siat_mobile
flutter pub add file_picker
```

```dart

// siat_mobile\lib\main_template.dart
import 'package:url_launcher/url_launcher.dart';

class _MyHomePageState extends State<MyHomePage> {
  /*
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  */
  
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = webViewController();
  }

  WebViewController webViewController() {
    WebViewController controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.setNavigationDelegate(NavigationDelegate(
      onNavigationRequest: (NavigationRequest request) async {
        if (Uri.parse("{{URI}}").host != Uri.parse(request.url).host) {
          await openExternalURL(request);
          return NavigationDecision.prevent;
        }
        if (request.url.endsWith('.pdf')) {
          await download(request);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
      onPageFinished: (String url) async {
        await listenInputFile();
      },
    ));
    controller.addJavaScriptChannel('Print', onMessageReceived: (onMessageReceived) async {
      await upload();
    });
    controller.loadRequest(Uri.parse("{{URI}}"));
    return controller;
  }

  Future<void> permission(String title, String desc) async {
    await Alert(
        context: context,
        title: title,
        desc: desc,
        buttons: [
        DialogButton(
            color: Colors.blue,
            onPressed: () async {
            await openAppSettings(); 
            if(mounted){
              Navigator.pop(context);
            }
            },
            child: const Text("Configurações", style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        ],
    ).show();
  }

  Future<void> download(NavigationRequest request) async {
    var status = await Permission.notification.status;

    if (!status.isGranted) {
      status = await Permission.notification.request();

      if (!status.isGranted) {
        await permission(
          "Permissão de Notificação",
          "Para executar downloads"
        );
        status = await Permission.notification.request();
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

  Future<void> listenInputFile() async {
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

  Future<void> upload() async {

    var status = await Permission.manageExternalStorage.status;

    if (!status.isGranted) {
      status = await Permission.manageExternalStorage.request();

      if (!status.isGranted) {
        await permission(
          "Permissão de Armazenamento",
          "Para executar uploads"
        );
        status = await Permission.manageExternalStorage.request();
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

  Future<void> openExternalURL(NavigationRequest request) async {
    await launchUrl(Uri.parse(request.url));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /*
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      */
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
```