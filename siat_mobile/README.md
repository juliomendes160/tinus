# Criar App

**Criar Global**

    Criar global no namespace correspodente.

    ^SIDVPM("IGA","APP") = "FISCO FÁCIL IGARASSU#https://play.google.com/store/apps/details?id=br.gov.igarassu##"

    Piece 1 - Título da logo quando não houver imagem 
    Piece 2 - Link do app na play store

**Gerar Imagens**
    
    Site para gerar imagens do aplicativo.
    
    https://www.appicon.co/

**Adicionar Imagens**

    Adicione as imagens dentro do projeto nas pastas correspondentes.

    siat_mobile\android\app\src\main\res\mipmap-*

    Adicionar imagens na pasta correspondente no TS.

    C:\InterSystems\teste\CSP\testeiga\portal\imagens\AppMobile\app_logo_pref.png
    C:\InterSystems\teste\CSP\testeiga\portal\imagens\AppMobile\app_logo_inicio.png

**CSPWEBMOBILE**

    Rotina responsável pela logo do app.

```objectscript
BODY
    DO PATH^EMIPDF
    S LOGOTOPO="",WLOGO=WDIRIMG_"imagens/AppMobile/app_logo_pref.png" IF ##class(%Library.File).Exists(PATH_WLOGO) S LOGOTOPO=WLOGO
    S LOGOAPP="",WLOGO=WDIRIMG_"imagens/AppMobile/app_logo_inicio.png" IF ##class(%Library.File).Exists(PATH_WLOGO) S LOGOAPP=WLOGO
 ```

# flutter

```bash
flutter pub add webview_flutter 
flutter pub add permission_handler 
flutter pub add rflutter_alert 
flutter pub add path_provider 
flutter pub add flutter_downloader 
flutter pub add file_picker
flutter pub add url_launcher
flutter pub add firebase_core
flutter pub add firebase_messaging
```

# flutterfire

```bash
flutterfire configure --project=siat-mobile-5a9ee
```

# Documentation

- [flutter](https://docs.flutter.dev)
- [webview_flutter](https://pub.dev/packages/webview_flutter)
- [permission_handler](https://pub.dev/packages/permission_handler)
- [rflutter_alert](https://pub.dev/packages/rflutter_alert)
- [path_provider](https://pub.dev/packages/path_provider)
- [flutter_downloader](https://pub.dev/packages/flutter_downloader)
- [file_picker](https://pub.dev/packages/file_picker)
- [url_launcher](https://pub.dev/packages/url_launcher)
- [firebase_core](https://pub.dev/packages/firebase_core)
- [firebase_messaging](https://pub.dev/packages/firebase_messaging)