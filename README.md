# ns_demo

A demo Flutter project using the My Online Objects system backend.

## Requirements

Environment Setup:

- Visual Studio Code version 1.63
  - Flutter extension for debugging
- Android Studio version 4.
- XCode (macOS) version 13.
- Flutter SDK version 2.8
- Dart SDK 2.15

Misc:

- My Online Objects System Account <https://myOnlineObjects.com>

Use the following flutter commands to check your environment:

- flutter doctor
- flutter upgrade

## References

See <https://api.flutter.dev/index.html>

See <https://gallery.flutter.dev/#/>

See <https://medium.com/flutter-community/11-things-to-remember-for-your-next-flutter-project-1c7c380895ca>

## Functions

- Code the various flutter tutorials and samples for learning purpose
- Basic app navigation: drawer, tab, and stack

## Components and Widgets Used

### JSON Annotation

See <https://github.com/google/json_serializable.dart/tree/master/example>

### JSON Serialization

flutter pub add json_serializable
See <https://pub.dev/packages/json_serializable/install>

dart pub add json_serializable

flutter pub run build_runner build

### State Management - Provider

flutter pub add provider
See <https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple>

- BuildContext
- Stateful and Stateless widgets
- Scaffold

See <https://api.flutter.dev/flutter/material/FlatButton-class.html>

### Material Module

This is the package flutter/material.dart

https://api.flutter.dev/flutter/material

- Widget
  - StatelessWidget
    - SafeArea
    - Container
    - Drawer

- StatefulWidget
  - MaterialApp
  - Scaffold
  - Navigator

### Navigation & Routing

See <https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade>

Drawer - <https://api.flutter.dev/flutter/material/Drawer-class.html>
  --> https://stackoverflow.com/questions/63287282/how-can-i-use-flutter-drawer-menu-in-page-routing

Right Drawer - https://api.flutter.dev/flutter/material/Scaffold/endDrawer.html

### Misc

- Equatable <https://pub.dev/packages/equatable>
- Shared Preferences <https://pub.dev/packages/shared_preference>
  an alternative to this is: get_storage
- See <https://medium.com/flutter-community/15-useful-libraries-for-flutter-development-productivity-updated-2021-15bcafe205f3>

## Issues

### Deployment to simulator takes too long

See QuickFix tool <https://docs.flutter.dev/development/tools/flutter-fix>

### network images are not showing on the web

- See <https://stackoverflow.com/questions/65653801/flutter-web-cant-load-network-image-from-another-domain>

- flutter run -d chrome --web-renderer html // to run the app

- flutter build web --web-renderer html --release // to generate a production build

### Initializing providers on app startup

- See <https://stackoverflow.com/questions/63520079/how-to-fetch-initial-data-using-provider-in-flutter-effectievly>

- Use Service Locator: <https://pub.dev/packages/get_it>

### A RenderFlex overflowed by 28 pixels on the right

See <https://fluttercorner.com/flutter-how-to-fix-a-renderflex-overflowed-by-pixels-error>

### Web Content 

C:\NouriSolutions\trunk2022\flutter\ns_demo>flutter pub add web_node
Resolving dependencies...
  _fe_analyzer_shared 33.0.0 (34.0.0 available)
  analyzer 3.1.0 (3.2.0 available)
  built_value 8.1.3 (8.1.4 available)
+ csslib 0.17.1
+ html 0.15.0
  js 0.6.3 (0.6.4 available)
  path 1.8.0 (1.8.1 available)
  source_span 1.8.1 (1.8.2 available)
  test_api 0.4.3 (0.4.9 available)
+ universal_html 2.0.8
+ universal_io 2.0.4
+ web_node 0.2.1
+ webview_flutter 2.8.0 (3.0.0 available)
+ webview_flutter_android 2.8.2
+ webview_flutter_platform_interface 1.8.1
+ webview_flutter_wkwebview 2.7.1
  win32 2.3.5 (2.3.8 available)
Downloading web_node 0.2.1...
Downloading universal_html 2.0.8...
Downloading universal_io 2.0.4...
Downloading webview_flutter 2.8.0...
Downloading webview_flutter_wkwebview 2.7.1...
Downloading webview_flutter_platform_interface 1.8.1...
Downloading webview_flutter_android 2.8.2...


## Flutter commands

### flutter devices output

PS C:\nourisolutions\trunk2022\flutter\ns_demo> flutter devices
4 connected devices:

SM T330NU (mobile)                 • c7d8c7f807133535 • android-arm    • Android 5.1.1 (API 22)
Android SDK built for x86 (mobile) • emulator-5554    • android-x86    • Android 10 (API 29) (emulator)
Chrome (web)                       • chrome           • web-javascript • Google Chrome 97.0.4692.71
Edge (web)                         • edge             • web-javascript • Microsoft Edge 97.0.1072.55

### flutter run -d <device>

Choose from the list generated by 'flutter devices' command
Examples:

- flutter run -d c7d8c7f807133535 (running on device)
    -- > OK
- flutter run -d edge (run on Microsoft Edge)
    --> OK

-- flutter run -d chrome (run on chrome)
    --> OK

## Getting Started with flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
