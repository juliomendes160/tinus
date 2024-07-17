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

# Criar APP

```objectscript

// Logo do APP rotina - CSPWEBMOBILE

;CSPWEBMOBILE: Este código requer a criação das pastas e o armazenamento das imagens no TS correspondentes.

BODY
	DO PATH^EMIPDF
	S LOGOTOPO="",WLOGO=WDIRIMG_"imagens/AppMobile/app_logo_pref.png" IF ##class(%Library.File).Exists(PATH_WLOGO) S LOGOTOPO=WLOGO
	S LOGOAPP="",WLOGO=WDIRIMG_"imagens/AppMobile/app_logo_inicio.png" IF ##class(%Library.File).Exists(PATH_WLOGO) S LOGOAPP=WLOGO
	;
```

# Packages

```bash
flutter pub add webview_flutter # https://pub.dev/packages/webview_flutter
flutter pub add permission_handler # https://pub.dev/packages/permission_handler
flutter pub add rflutter_alert # https://pub.dev/packages/rflutter_alert
flutter pub add path_provider # https://pub.dev/packages/path_provider
flutter pub add flutter_downloader # https://pub.dev/packages/flutter_downloader
flutter pub add file_picker # https://pub.dev/packages/file_picker
flutter pub add url_launcher # https://pub.dev/packages/url_launcher
```