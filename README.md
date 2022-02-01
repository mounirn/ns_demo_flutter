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

### Web View Android Build

:\NouriSolutions\trunk2022\flutter\ns_demo>flutter run -d c7d8c7f807133535
Launching lib\main.dart on SM T330NU in debug mode...
E/FlutterFcmService( 9588): Fatal: failed to find callback
C:\NouriSolutions\trunk2022\flutter\ns_demo\android\app\src\debug\AndroidManifest.xml Error:
        uses-sdk:minSdkVersion 16 cannot be smaller than version 19 declared in library [:webview_flutter_android] C:\NouriSolutions\trunk2022\flutter\ns_demo\build\webview_flutter_android\intermediates\library_manifest\debug\AndroidManifest.xml as the library might be using APIs not available in 16
        Suggestion: use a compatible library with a minSdk of at most 16,
                or increase this project's minSdk version to at least 19,
                or use tools:overrideLibrary="io.flutter.plugins.webviewflutter" to 
force usage (may lead to runtime failures)

FAILURE: Build failed with an exception.

- What went wrong:

- Execution failed for task ':app:processDebugMainManifest'.

> Manifest merger failed : uses-sdk:minSdkVersion 16 cannot be smaller than version 
19 declared in library [:webview_flutter_android] C:\NouriSolutions\trunk2022\flutter\ns_demo\build\webview_flutter_android\intermediates\library_manifest\debug\AndroidManifest.xml as the library might be using APIs not available in 16
        Suggestion: use a compatible library with a minSdk of at most 16,
                or increase this project's minSdk version to at least 19,
                or use tools:overrideLibrary="io.flutter.plugins.webviewflutter" to 
force usage (may lead to runtime failures)

- Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

- Get more help at https://help.gradle.org

BUILD FAILED in 6m 3s
Running Gradle task 'assembleDebug'...                            392.7s

The plugin webview_flutter_android requires a higher Android SDK version.
Fix this issue by adding the following to the file
C:\NouriSolutions\trunk2022\flutter\ns_demo\android\app\build.gradle:
android {
  defaultConfig {
    minSdkVersion 19
  }
}

### Android build errors

Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.

Running Gradle task 'assembleDebug'...                            139.3s
√  Built build\app\outputs\flutter-apk\app-debug.apk.
Installing build\app\outputs\flutter-apk\app.apk...                40.7s
Syncing files to device SM T330NU...                               286ms

Flutter run key commands.
r Hot reload.
R Hot restart.
h List all available interactive commands.
d Detach (terminate "flutter run" but leave application running).
c Clear the screen
q Quit (terminate the application on the device).

 Running with sound null safety

### Loading assets error

An Observatory debugger and profiler on SM T330NU is available at:
http://127.0.0.1:29170/dyc36ZrNEps=/
E/flutter (28978): [ERROR:flutter/lib/ui/ui_dart_state.cc(209)] Unhandled Exception: Unable to load asset: config.json
E/flutter (28978): #0      PlatformAssetBundle.load (package:flutter/src/services/asset_bundle.dart:237:7)
E/flutter (28978): <asynchronous suspension>
E/flutter (28978): #1      AssetBundle.loadString (package:flutter/src/services/asset_bundle.dart:72:27)
E/flutter (28978): <asynchronous suspension>
E/flutter (28978): #2      NsAppConfigData.loadConfigAsync (package:ns_demo/providers/config_data.dart:24:23)
E/flutter (28978): <asynchronous suspension>
E/flutter (28978): #3      NsAppConfigData.load (package:ns_demo/providers/config_data.dart:40:5)
E/flutter (28978): <asynchronous suspension>
E/flutter (28978):
The Flutter DevTools debugger and profiler on SM T330NU is available at:
http://127.0.0.1:9102?uri=http://127.0.0.1:29170/dyc36ZrNEps=/
I/Timeline(28978): Timeline: Activity_idle id: android.os.BinderProxy@167cab56 time:1484464199

### Dart Error: error: import of dart:mirrors is not supported i import of dart:mirrors is not supported in the current Dart runtime

Installing build\app\outputs\flutter-apk\app.apk...                48.2s
E/flutter (32417): [ERROR:flutter/shell/common/shell.cc(94)] Dart Error: error: import of dart:mirrors is not supported i import of dart:mirrors is not supported in the current Dart runtime
E/flutter (32417): [ERROR:flutter/runtime/dart_isolate.cc(177)] Could not prepare isolate.re isolate.                                                                     create root isolate.
E/flutter (32417): [ERROR:flutter/runtime/runtime_controller.cc(384)] Could notengine with configuration. create root isolate.
E/flutter (32417): [ERROR:flutter/shell/common/shell.cc(574)] Could not launch 
engine with configuration.
Error connecting to the service protocol: failed to connect to
http://127.0.0.1:1500/EHjwNZzv2z4=/

### Deprecated API error

Running Gradle task 'assembleDebug'...       Note: Some input files use or override a deprecated API.
Running Gradle task 'assembleDebug'...       Note: Recompile with -Xlint:deprecation for details.
Running Gradle task 'assembleDebug'...                                 /

Try flutter build ios/android --debug (or --profile or --release)

### Font Manifest and assets error

Font manifest does not exist at `assets/FontManifest.json` – ignoring.


## Flutter commands

### flutter devices output

PS C:\nourisolutions\trunk2022\flutter\ns_demo> flutter devices
4 connected devices:

SM T330NU (mobile)                 • c7d8c7f807133535 • android-arm    • Android 5.1.1 (API 22)
Android SDK built for x86 (mobile) • emulator-5554    • android-x86    • Android 10 (API 29) (emulator)
Chrome (web)                       • chrome           • web-javascript • Google Chrome 97.0.4692.71
Edge (web)                         • edge             • web-javascript • Microsoft Edge 97.0.1072.55

### flutter run -d {device}

Choose from the list generated by 'flutter devices' command
Examples:

- flutter run -d c7d8c7f807133535 (running on device)
    -- > OK
- flutter run -d edge (run on Microsoft Edge)
    --> OK

- flutter run -d chrome (run on chrome)
    --> OK
- flutter run -d chrome --web-renderer html


## flutter -h

Manage your Flutter app development.

Common commands:

  flutter create <output directory>
    Create a new Flutter project in the specified directory.

  flutter run [options]
    Run your Flutter application on an attached device or in an emulator.

Usage: flutter <command> [arguments]

Global options:
-h, --help                  Print this usage information.
-v, --verbose               Noisy logging, including all shell commands executed.
                            If used with "--help", shows hidden options. If used with "flutter doctor", shows additional       
                            diagnostic information. (Use "-vv" to force verbose logging in those cases.)
-d, --device-id             Target device id or name (prefixes allowed).
    --version               Reports the version of this tool.
    --suppress-analytics    Suppress analytics reporting when this command runs.

Available commands:

Flutter SDK
  bash-completion   Output command line shell completion setup scripts.
  channel           List or switch Flutter channels.
  config            Configure Flutter settings.
  doctor            Show information about the installed tooling.
  downgrade         Downgrade Flutter to the last active version for the current channel.
  precache          Populate the Flutter tool's cache of binary artifacts.
  upgrade           Upgrade your copy of Flutter.

Project
  analyze           Analyze the project's Dart code.
  assemble          Assemble and build Flutter resources.
  build             Build an executable app or install bundle.
  clean             Delete the build/ and .dart_tool/ directories.
  create            Create a new Flutter project.
  drive             Run integration tests for the project on an attached device or emulator.
  format            Format one or more Dart files.
  gen-l10n          Generate localizations for the current project.
  pub               Commands for managing Flutter packages.
  run               Run your Flutter app on an attached device.
  test              Run Flutter unit tests for the current project.

Tools & Devices
  attach            Attach to a running app.
  custom-devices    List, reset, add and delete custom devices.
  devices           List all connected devices.
  emulators         List, launch and create emulators.
  install           Install a Flutter app on an attached device.
  logs              Show log output for running Flutter apps.
  screenshot        Take a screenshot from a connected device.
  symbolize         Symbolize a stack trace from an AOT-compiled Flutter app.

Run "flutter help <command>" for more information about a command.
Run "flutter help -v" for verbose help output, including less commonly used options.

## Emulators 

- flutter emulators (lists emulators defined)
- flutter emulators --launch {emulator id} to start it
- flutter devices 

## App Icons

- Use <https://icon.kitchen>

## Getting Started with flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
