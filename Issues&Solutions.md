# Issues Encountered and Solutions Found

Below is a list of issues encountered during development and solutions/pointers found to resolve these issues

## Loading assets error

>> Make sure to not include '/' before your asset path. Use 'assets/...' instead of '/assets/...'

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

## Dart Error: error: import of dart:mirrors is not supported in the current Dart runtime

Installing build\app\outputs\flutter-apk\app.apk...                48.2s
E/flutter (32417): [ERROR:flutter/shell/common/shell.cc(94)] Dart Error: error: import of dart:mirrors is not supported i import of dart:mirrors is not supported in the current Dart runtime
E/flutter (32417): [ERROR:flutter/runtime/dart_isolate.cc(177)] Could not prepare isolate.re isolate.                                                                     create root isolate.
E/flutter (32417): [ERROR:flutter/runtime/runtime_controller.cc(384)] Could notengine with configuration. create root isolate.
E/flutter (32417): [ERROR:flutter/shell/common/shell.cc(574)] Could not launch 
engine with configuration.
Error connecting to the service protocol: failed to connect to
http://127.0.0.1:1500/EHjwNZzv2z4=/


## Font Manifest and assets error

Font manifest does not exist at `assets/FontManifest.json` – ignoring.

## Deprecated API error

Running Gradle task 'assembleDebug'...       Note: Some input files use or override a deprecated API.
Running Gradle task 'assembleDebug'...       Note: Recompile with -Xlint:deprecation for details.
Running Gradle task 'assembleDebug'...

Try flutter build ios/android --debug (or --profile or --release)


### Deployment to simulator takes too long

See QuickFix tool <https://docs.flutter.dev/development/tools/flutter-fix>

### network images are not showing on the web

- See <https://stackoverflow.com/questions/65653801/flutter-web-cant-load-network-image-from-another-domain>

- flutter run -d chrome --web-renderer html // to run the app

- flutter build web --web-renderer html --release // to generate a production build

### Initializing providers on app startup

- See <https://stackoverflow.com/questions/63520079/how-to-fetch-initial-data-using-provider-in-flutter-effectievly>

- Use Service Locator: <https://pub.dev/packages/get_it>

## A RenderFlex overflowed by 28 pixels on the right

>> Put your content in a scrollable view

See <https://fluttercorner.com/flutter-how-to-fix-a-renderflex-overflowed-by-pixels-error>

## Web Content 

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

## Web View Android Build

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

## Testing using emulators

C:\NouriSolutions\trunk2022\flutter\ns_demo>flutter run -d emulator-5554
Using hardware rendering with device Android SDK built for x86. If you notice
graphics artifacts, consider enabling software rendering with
"--enable-software-rendering".
Launching lib\main.dart on Android SDK built for x86 in debug mode...

## Casting error (using as)

══╡ EXCEPTION CAUGHT BY WIDGETS LIBRARY
╞═══════════════════════════════════════════════════════════
The following _CastError was thrown building NsAppErrorScreen(dirty, dependencies:[_ModalScopeStatus]):
type '_InternalLinkedHashMap<String, String>' is not a subtype of type
'NsAppObject' in type cast

The relevant error-causing widget was:
  NsAppErrorScreen
  NsAppErrorScreen:file:///C:/NouriSolutions/trunk2022/flutter/ns_demo/lib/utils/r  outes.dart:35:41

When the exception was thrown, this was the stack:
#0      NsAppErrorScreen.build (package:ns_demo/screens/error.dart:14:61)
#1      StatelessElement.build
(package:flutter/src/widgets/framework.dart:4662:28)
#2      ComponentElement.performRebuild
(package:flutter/src/widgets/framework.dart:4588:15)
#3      Element.rebuild (package:flutter/src/widgets/framework.dart:4311:5)       
#4      BuildOwner.buildScope (package:flutter/src/widgets/framework.dart:2578:33)#5      WidgetsBinding.drawFrame (package:flutter/src/widgets/binding.dart:882:21)#6      RendererBinding._handlePersistentFrameCallback
(package:flutter/src/rendering/binding.dart:363:5)
#7      SchedulerBinding._invokeFrameCallback
(package:flutter/src/scheduler/binding.dart:1145:15)
#8      SchedulerBinding.handleDrawFrame
(package:flutter/src/scheduler/binding.dart:1082:9)
#9      SchedulerBinding.scheduleWarmUpFrame.<anonymous closure>
(package:flutter/src/scheduler/binding.dart:863:7)
(elided 4 frames from class _RawReceivePortImpl, class _Timer, and
dart:async-patch)

## Layout issue

Performing hot reload...
Try again after fixing the above error(s).

══╡ EXCEPTION CAUGHT BY RENDERING LIBRARY
╞═════════════════════════════════════════════════════════
The following assertion was thrown during performLayout():
RenderFlex children have non-zero flex but incoming height constraints are 
unbounded.
When a column is in a parent that does not provide a finite height
constraint, for example if it is
in a vertical scrollable, it will try to shrink-wrap its children along the vertical axis. Setting a
flex on a child (e.g. using Expanded) indicates that the child is to expandto fill the remaining
space in the vertical direction.
These two directives are mutually exclusive. If a parent is to shrink-wrap 
its child, the child
cannot simultaneously expand to fit its parent.
Consider setting mainAxisSize to MainAxisSize.min and using FlexFit.loose  
fits for the flexible
children (using Flexible rather than Expanded). This will allow the        
flexible children to size
themselves to less than the infinite remaining space they would otherwise  
be forced to take, and
then will cause the RenderFlex to shrink-wrap the children rather than     
expanding to fit the maximum
constraints provided by the parent.
If this message did not help you determine the problem, consider using     
debugDumpRenderTree():
  https://flutter.dev/debugging/#rendering-layer
  http://api.flutter.dev/flutter/rendering/debugDumpRenderTree.html        
The affected RenderFlex is:
  RenderFlex#35206 relayoutBoundary=up13 NEEDS-LAYOUT NEEDS-PAINT
  NEEDS-COMPOSITING-BITS-UPDATE(creator: Column ← Center ← ColoredBox ←    
  Container ← _SingleChildViewport ← IgnorePointer-[GlobalKey#4c295] ←     
  Semantics ← Listener ← _GestureSemantics ←
  RawGestureDetector-[LabeledGlobalKey<RawGestureDetectorState>#f86d3] ←   
  Listener ← _ScrollableScope ← ⋯, parentData: offset=Offset(0.0, 0.0) (can  use size), constraints: BoxConstraints(0.0<=w<=392.7, 0.0<=h<=Infinity), 
  size: MISSING, direction: vertical, mainAxisAlignment: start,
  mainAxisSize: max, crossAxisAlignment: center, verticalDirection: down)  
The creator information is set to:
  Column ← Center ← ColoredBox ← Container ← _SingleChildViewport ←        
  IgnorePointer-[GlobalKey#4c295]
  ← Semantics ← Listener ← _GestureSemantics ←
  RawGestureDetector-[LabeledGlobalKey<RawGestureDetectorState>#f86d3] ←   
  Listener ← _ScrollableScope
  ← ⋯
The nearest ancestor providing an unbounded width constraint is:
_RenderSingleChildViewport#99e92 relayoutBoundary=up10 NEEDS-LAYOUT        
NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE:
  needs compositing
  creator: _SingleChildViewport ← IgnorePointer-[GlobalKey#4c295] ←        
  Semantics ← Listener ←
    _GestureSemantics ←
    RawGestureDetector-[LabeledGlobalKey<RawGestureDetectorState>#f86d3] ← 
    Listener ← _ScrollableScope ← _ScrollSemantics-[GlobalKey#604bf] ←     
    NotificationListener<ScrollMetricsNotification> ← RepaintBoundary ←    
    CustomPaint ← ⋯
  parentData: <none> (can use size)
  constraints: BoxConstraints(0.0<=w<=392.7, 0.0<=h<=716.7)
  size: MISSING
See also: https://flutter.dev/layout/
If none of the above helps enough to fix this problem, please don't        
hesitate to file a bug:
  https://github.com/flutter/flutter/issues/new?template=2_bug.md

The relevant error-causing widget was:
  Column
  Column:file:///C:/NouriSolutions/trunk2022/flutter/ns_demo/lib/screens/er  ror.dart:32:13

When the exception was thrown, this was the stack:
#0      RenderFlex.performLayout.<anonymous closure>
(package:flutter/src/rendering/flex.dart:926:9)
#1      RenderFlex.performLayout
(package:flutter/src/rendering/flex.dart:929:6)
#2      RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#3      RenderPositionedBox.performLayout
(package:flutter/src/rendering/shifted_box.dart:437:14)
#4      RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#5      RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#6      RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#7      _RenderSingleChildViewport.performLayout
(package:flutter/src/widgets/single_child_scroll_view.dart:504:14)
#8      RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#9      RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#10     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#11     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#12     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#13     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#14     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#15     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#16     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#17     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#18     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#19     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#20     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#21     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#22     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#23     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#24     RenderCustomPaint.performLayout
(package:flutter/src/rendering/custom_paint.dart:545:11)
#25     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#26     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#27     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#28     MultiChildLayoutDelegate.layoutChild
(package:flutter/src/rendering/custom_layout.dart:171:12)
#29     _ScaffoldLayout.performLayout
(package:flutter/src/material/scaffold.dart:1005:7)
#30     MultiChildLayoutDelegate._callPerformLayout
(package:flutter/src/rendering/custom_layout.dart:240:7)
#31     RenderCustomMultiChildLayoutBox.performLayout
(package:flutter/src/rendering/custom_layout.dart:403:14)
#32     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#33     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#34     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#35     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#36     _RenderCustomClip.performLayout
(package:flutter/src/rendering/proxy_box.dart:1376:11)
#37     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#38     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#39     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#40     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#41     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#42     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#43     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#44     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#45     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#46     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#47     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#48     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#49     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#50     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#51     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#52     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#53     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#54     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#55     RenderOffstage.performLayout
(package:flutter/src/rendering/proxy_box.dart:3428:13)
#56     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#57     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#58     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#59     _RenderTheatre.performLayout
(package:flutter/src/widgets/overlay.dart:751:15)
#60     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#61     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#62     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#63     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#64     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#65     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#66     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#67     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#68     RenderCustomPaint.performLayout
(package:flutter/src/rendering/custom_paint.dart:545:11)
#69     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#70     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#71     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#72     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#73     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#74     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#75     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#76     RenderProxyBoxMixin.performLayout
(package:flutter/src/rendering/proxy_box.dart:116:14)
#77     RenderObject.layout
(package:flutter/src/rendering/object.dart:1852:7)
#78     RenderView.performLayout
(package:flutter/src/rendering/view.dart:165:14)
#79     RenderObject._layoutWithoutResize
(package:flutter/src/rendering/object.dart:1707:7)
#80     PipelineOwner.flushLayout
(package:flutter/src/rendering/object.dart:879:18)
#81     RendererBinding.drawFrame
(package:flutter/src/rendering/binding.dart:497:19)
#82     WidgetsBinding.drawFrame
(package:flutter/src/widgets/binding.dart:883:13)
#83     RendererBinding._handlePersistentFrameCallback
(package:flutter/src/rendering/binding.dart:363:5)
#84     SchedulerBinding._invokeFrameCallback
(package:flutter/src/scheduler/binding.dart:1145:15)
#85     SchedulerBinding.handleDrawFrame
(package:flutter/src/scheduler/binding.dart:1082:9)
#86     SchedulerBinding.scheduleWarmUpFrame.<anonymous closure>
(package:flutter/src/scheduler/binding.dart:863:7)
(elided 4 frames from class _RawReceivePortImpl, class _Timer, and
dart:async-patch)

The following RenderObject was being processed when the exception was      
fired: RenderFlex#35206 relayoutBoundary=up13 NEEDS-LAYOUT NEEDS-PAINT     
NEEDS-COMPOSITING-BITS-UPDATE:
  creator: Column ← Center ← ColoredBox ← Container ← _SingleChildViewport 
  ←
    IgnorePointer-[GlobalKey#4c295] ← Semantics ← Listener ←
    _GestureSemantics ←
    RawGestureDetector-[LabeledGlobalKey<RawGestureDetectorState>#f86d3] ← 
    Listener ← _ScrollableScope
    ← ⋯
  parentData: offset=Offset(0.0, 0.0) (can use size)
  constraints: BoxConstraints(0.0<=w<=392.7, 0.0<=h<=Infinity)
  size: MISSING
  direction: vertical
  mainAxisAlignment: start
  mainAxisSize: max
  crossAxisAlignment: center
  verticalDirection: down
This RenderObject had the following descendants (showing up to depth 5):   
    child 1: RenderPadding#45116 NEEDS-LAYOUT NEEDS-PAINT
    NEEDS-COMPOSITING-BITS-UPDATE
      child: RenderPadding#422ae NEEDS-LAYOUT NEEDS-PAINT
      NEEDS-COMPOSITING-BITS-UPDATE
        child: RenderPadding#70f21 NEEDS-LAYOUT NEEDS-PAINT
        NEEDS-COMPOSITING-BITS-UPDATE
          child: RenderParagraph#b032c NEEDS-LAYOUT NEEDS-PAINT
            text: TextSpan
    child 2: RenderConstrainedBox#a564e NEEDS-LAYOUT NEEDS-PAINT
    NEEDS-COMPOSITING-BITS-UPDATE
      child: RenderPositionedBox#d00fb NEEDS-LAYOUT NEEDS-PAINT
      NEEDS-COMPOSITING-BITS-UPDATE
        child: RenderPadding#9d171 NEEDS-LAYOUT NEEDS-PAINT
        NEEDS-COMPOSITING-BITS-UPDATE
          child: RenderConstrainedBox#bb070 NEEDS-LAYOUT NEEDS-PAINT       
          NEEDS-COMPOSITING-BITS-UPDATE
            child: RenderDecoratedBox#40056 NEEDS-LAYOUT NEEDS-PAINT       
            NEEDS-COMPOSITING-BITS-UPDATE
    child 3: RenderSemanticsAnnotations#ae741 NEEDS-LAYOUT NEEDS-PAINT     
    NEEDS-COMPOSITING-BITS-UPDATE
      child: RenderPadding#3ef31 NEEDS-LAYOUT NEEDS-PAINT
      NEEDS-COMPOSITING-BITS-UPDATE
        child: RenderPhysicalShape#63171 NEEDS-LAYOUT NEEDS-PAINT
        NEEDS-COMPOSITING-BITS-UPDATE
          child: RenderCustomPaint#bbd5a NEEDS-LAYOUT NEEDS-PAINT
          NEEDS-COMPOSITING-BITS-UPDATE
            child: _RenderInkFeatures#a740f NEEDS-LAYOUT NEEDS-PAINT       
            NEEDS-COMPOSITING-BITS-UPDATE
    child 4: RenderConstrainedBox#31e41 NEEDS-LAYOUT NEEDS-PAINT
    NEEDS-COMPOSITING-BITS-UPDATE
      child: RenderPositionedBox#99012 NEEDS-LAYOUT NEEDS-PAINT
      NEEDS-COMPOSITING-BITS-UPDATE
        child: RenderPadding#9417b NEEDS-LAYOUT NEEDS-PAINT
        NEEDS-COMPOSITING-BITS-UPDATE
          child: RenderConstrainedBox#fa60f NEEDS-LAYOUT NEEDS-PAINT       
          NEEDS-COMPOSITING-BITS-UPDATE
            child: RenderDecoratedBox#fb3ce NEEDS-LAYOUT NEEDS-PAINT       
            NEEDS-COMPOSITING-BITS-UPDATE
    child 5: RenderSemanticsAnnotations#e6f64 NEEDS-LAYOUT NEEDS-PAINT     
    NEEDS-COMPOSITING-BITS-UPDATE
      child: RenderPadding#595ab NEEDS-LAYOUT NEEDS-PAINT
      NEEDS-COMPOSITING-BITS-UPDATE
        child: RenderPhysicalShape#e1427 NEEDS-LAYOUT NEEDS-PAINT
        NEEDS-COMPOSITING-BITS-UPDATE
          child: RenderCustomPaint#cf2fd NEEDS-LAYOUT NEEDS-PAINT
          NEEDS-COMPOSITING-BITS-UPDATE
            child: _RenderInkFeatures#cfc3b NEEDS-LAYOUT NEEDS-PAINT       
            NEEDS-COMPOSITING-BITS-UPDATE
    ...(descendants list truncated after 25 lines)
════════════════════════════════════════════════════════════════════════════════════════════════════

Another exception was thrown: RenderBox was not laid out: RenderFlex#35206 
relayoutBoundary=up13 NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
RenderPositionedBox#164f6 relayoutBoundary=up12 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
_RenderColoredBox#facfe relayoutBoundary=up11 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
_RenderSingleChildViewport#99e92 relayoutBoundary=up10 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
RenderIgnorePointer#ed46f relayoutBoundary=up9 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
RenderSemanticsAnnotations#2e65a relayoutBoundary=up8 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
RenderPointerListener#0a184 relayoutBoundary=up7 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
RenderSemanticsGestureHandler#8ee1f relayoutBoundary=up6 NEEDS-PAINT       
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
RenderPointerListener#d82e5 relayoutBoundary=up5 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
_RenderScrollSemantics#f778d relayoutBoundary=up4 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
RenderRepaintBoundary#4e283 relayoutBoundary=up3 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
RenderCustomPaint#5d35a relayoutBoundary=up2 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
RenderRepaintBoundary#c8fb6 relayoutBoundary=up1 NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE

Another exception was thrown: RenderBox was not laid out:
RenderRepaintBoundary#c8fb6 relayoutBoundary=up1 NEEDS-PAINT
Performing hot reload...
Reloaded 29 of 1063 libraries in 5,288ms.

## Invalid argument (string): Contains invalid characters

══╡ EXCEPTION CAUGHT BY WIDGETS LIBRARY
╞═══════════════════════════════════════════════════════════
The following ArgumentError was thrown building
NsNotes(dirty):
Invalid argument (string): Contains invalid characters.:   
"<p>Gabes is the capital city of
the&nbsp;<a title=\"Gabès Governorate\"
href=\"https://en.wikipedia.org/wiki/Gab%C3%A8s_Governorate\">Gabès Governorate</a>&nbsp;in&nbsp;<a
title=\"Tunisia\"
href=\"https://en.wikipedia.org/wiki/Tunisia\">Tunisia</a>.It is located on the
coast of the&nbsp;<a title=\"Gulf of Gabès\"
href=\"https://en.wikipedia.org/wiki/Gulf_of_Gab%C3%A8s\">Gulf of Gabès</a>. With a population of
152,921, Gabès is the&nbsp;<a title=\"Tunisia\"
href=\"https://en.wikipedia.org/wiki/Tunisia#Major_cities\">6th largest Tunisian city</a>.<sup
id=\"cite_ref-Gabesmun_1-1\" class=\"reference\"><a        
href=\"https://en.wikipedia.org/wiki/Gab%C3%A8s#cite_note-Gabesmun-1\">[1] -&nbsp;</a><a
href=\"https://en.wikipedia.org/wiki/Gab%C3%A8s\">https://en.wikipedia.org/wiki/Gab%C3%A8s</a></sup></p>\n<p>&nbsp;</p>"

The relevant error-causing widget was:
  NsNotes
  NsNotes:file:///C:/NouriSolutions/trunk2022/flutter/ns_de  mo/lib/app/widgets/client_info.dart:34:15

When the exception was thrown, this was the stack:
#0      _UnicodeSubsetEncoder.convert
(dart:convert/ascii.dart:85:9)
#1      AsciiCodec.encode (dart:convert/ascii.dart:41:46)  
#2      new UriData.fromString (dart:core/uri.dart:3189:44)#3      new Uri.dataFromString (dart:core/uri.dart:288:28) 
#4      NsNotes.getWebView
(package:ns_demo/app/object/notes.dart:58:21)
#5      NsNotes.getView
(package:ns_demo/app/object/notes.dart:44:14)
#6      NsNotes.build
(package:ns_demo/app/object/notes.dart:34:18)

════════════════════════════════════════════════════════════════════════════════════════════════════
D/EGL_emulation(12112): eglMakeCurrent: 0xe8a7eb00: ver 2 0 (tinfo 0xbe1716e0)
W/System  (12112): A resource failed to call release. 
W/System  (12112): A resource failed to call release. 

## D/AndroidRuntime(12112): Shutting down VM

E/AndroidRuntime(12112): FATAL EXCEPTION: main
E/AndroidRuntime(12112): Process: com.nouris.ns_demo, PID: 12112
E/AndroidRuntime(12112): java.lang.NullPointerException: Attempt to read from field 'android.view.WindowManager$LayoutParams android.view.ViewRootImpl.mWindowAttributes' on a null object reference
E/AndroidRuntime(12112):        at android.view.inputmethod.InputMethodManager.startInputInner(InputMethodManager.java:1625)
E/AndroidRuntime(12112):        at android.view.inputmethod.InputMethodManager.checkFocus(InputMethodManager.java:1864)
E/AndroidRuntime(12112):        at android.view.inputmethod.InputMethodManager.isActive(InputMethodManager.java:1183)
E/AndroidRuntime(12112):        at io.flutter.plugins.webviewflutter.InputAwareWebView$1.run(InputAwareWebView.java:195)
E/AndroidRuntime(12112):        at android.os.Handler.handleCallback(Handler.java:883)
E/AndroidRuntime(12112):        at android.os.Handler.dispatchMessage(Handler.java:100)
E/AndroidRuntime(12112):        at android.os.Looper.loop(Looper.java:214)
E/AndroidRuntime(12112):        at android.app.ActivityThread.main(ActivityThread.java:7356)
E/AndroidRuntime(12112):        at java.lang.reflect.Method.invoke(Native Method)
E/AndroidRuntime(12112):        at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:492)
E/AndroidRuntime(12112):        at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:930)
I/.nouris.ns_dem(12112): NativeAlloc concurrent copying GC freed 6221(473KB) AllocSpace objects, 0(0B) LOS objects, 49% free, 1731KB/3463KB, paused 448us total 114.861ms
W/.nouris.ns_dem(12112): Reducing the number of considered missed Gc histogram windows from 6160 to 100
I/Process (12112): Sending signal. PID: 12112 SIG: 9
Lost connection to device.

## lost connection to device

An Observatory debugger and profiler on SM T330NU is available at:
http://127.0.0.1:3045/KewP7-Jr1Tc=/
I/Timeline(28518): Timeline: Activity_idle id: android.os.BinderProxy@247c18c4 time:1919382296
The Flutter DevTools debugger and profiler on SM T330NU is available at:
http://127.0.0.1:9102?uri=http://127.0.0.1:3045/KewP7-Jr1Tc=/
I/art     (28518): Explicit concurrent mark sweep GC freed 8900(590KB) AllocSpace objects, 5(80KB) LOS objects, 53% free, 3MB/7MB, paused 1.149ms total 98.982ms
Lost connection to device.

## WebNode /WebView Disallowed attribute

>> See <https://stackoverflow.com/questions/62840032>

>flutter-web-htmlelementview-removing-disallowed-attribute
Removing disallowed attribute <P style="text-align: center;">
Removing disallowed attribute <P style="text-align: center;">
Removing disallowed attribute <SPAN style="font-family: Frutiger, Futura, 'Gills Sans',
Helvetica, Lucida, Optima, Palatino, 'Agfa Rotis', Arial, 'and Univers'; font-size: 13.6px;">   
Removing disallowed attribute <P style="text-align: center;">
Removing disallowed attribute <A href="http://company.nouris.net/#solutions">
Removing disallowed attribute <SPAN style="font-family: Frutiger, Futura, 'Gills Sans',
Helvetica, Lucida, Optima, Palatino, 'Agfa Rotis', Arial, 'and Univers'; font-size: 13.6px;">   
Removing disallowed attribute <P style="text-align: center;">
Removing disallowed attribute <A rel="noopener">
Removing disallowed attribute <A href="https://myOnlineObjects.com/">
Removing disallowed attribute <A rel="noopener">
Removing disallowed attribute <A href="https://nouris.net/">
Removing disallowed attribute <A rel="noopener">
Removing disallowed attribute <A href="https://nouris.net/">
Removing disallowed attribute <A href="https://nouris.net/#solutions">
Removing disallowed attribute <P style="text-align: center;">
Removing disallowed attribute <P style="text-align: center;">
Removing disallowed attribute <SPAN style="font-family: Frutiger, Futura, 'Gills Sans',
Helvetica, Lucida, Optima, Palatino, 'Agfa Rotis', Arial, 'and Univers'; font-size: 13.6px;">   
Removing disallowed attribute <P style="text-align: center;">
Removing disallowed attribute <A rel="noopener">
Removing disallowed attribute <A href="https://myOnlineObjects.com/">
Removing disallowed attribute <A rel="noopener">
Removing disallowed attribute <A href="https://nouris.net/">
Removing disallowed attribute <A rel="noopener">
Removing disallowed attribute <A href="https://nouris.net/">
Removing disallowed attribute <A href="https://nouris.net/#solutions">

## AppBar render issue

══╡ EXCEPTION CAUGHT BY RENDERING LIBRARY
╞═════════════════════════════════════════════════════════
The following assertion was thrown during layout:
A RenderFlex overflowed by 10.0 pixels on the right.

The relevant error-causing widget was:
  AppBar AppBar:file:///C:/NouriSolutions/trunk2022/flutter/ns_demo/lib/utils/app_bar.dart:9:10 

To inspect this widget in Flutter DevTools, visit:
http://127.0.0.1:9101/#/inspector?uri=http%3A%2F%2F127.0.0.1%3A2176%2F6ZIh4h57CuI%3D&inspectorRef=inspector-0

The overflowing RenderFlex has an orientation of Axis.horizontal.
The edge of the RenderFlex that is overflowing has been marked in the rendering with a yellow
and
black striped pattern. This is usually caused by the contents being too big for the RenderFlex.
Consider applying a flex factor (e.g. using an Expanded widget) to force the children of the
RenderFlex to fit within the available space instead of being sized to their natural size.
This is considered an error condition because it indicates that there is content that cannot be
seen. If the content is legitimately bigger than the available space, consider clipping it with
a
ClipRect widget before putting it in the flex, or using a scrollable container rather than a
Flex,
like a ListView.
The specific RenderFlex in question is: RenderFlex#163bd relayoutBoundary=up12 OVERFLOWING:
  creator: Row ← IconTheme ← Builder ← LayoutId-[<_ToolbarSlot.trailing>] ←
  CustomMultiChildLayout ←
    NavigationToolbar ← DefaultTextStyle ← IconTheme ← Builder ← CustomSingleChildLayout ←
    ClipRect ←
    MediaQuery ← ⋯
  parentData: offset=Offset(0.0, 0.0); id=_ToolbarSlot.trailing (can use size)
  constraints: BoxConstraints(0.0<=w<=150.0, 0.0<=h<=56.0)
  size: Size(150.0, 56.0)
  direction: horizontal
  mainAxisAlignment: start
  mainAxisSize: min
  crossAxisAlignment: stretch
  textDirection: ltr
  verticalDirection: down
◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤
════════════════════════════════════════════════════════════════════════════════════════════════════

## Using HtmlWebView

>> still issue with disallowed links

Restarted application in 493ms.
Removing disallowed attribute <A href="https://en.wikipedia.org/wiki/Gab%C3%A8s">
Removing disallowed attribute <A
href="https://en.wikipedia.org/wiki/Gab%C3%A8s#cite_note-Gabesmun-1">
Removing disallowed attribute <A href="https://en.wikipedia.org/wiki/Tunisia#Major_cities">     
Removing disallowed attribute <A href="https://en.wikipedia.org/wiki/Gulf_of_Gab%C3%A8s">       
Removing disallowed attribute <A href="https://en.wikipedia.org/wiki/Tunisia">
Removing disallowed attribute <A href="https://en.wikipedia.org/wiki/Gab%C3%A8s_Governorate">   
══╡ EXCEPTION CAUGHT BY RENDERING LIBRARY
╞═════════════════════════════════════════════════════════
The following assertion was thrown during performLayout():
RenderConstrainedBox object was given an infinite size during layout.
This probably means that it is a render object that tries to be as big as possible, but it was  
put
inside another render object that allows its children to pick their own size.
The nearest ancestor providing an unbounded height constraint is:
_RenderSingleChildViewport#74c55 relayoutBoundary=up14 NEEDS-LAYOUT NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE:
  needs compositing
  creator: _SingleChildViewport ← IgnorePointer-[GlobalKey#f6dcd] ← Semantics ← Listener ←
    _GestureSemantics ← RawGestureDetector-[LabeledGlobalKey<RawGestureDetectorState>#d347c] ←  
    Listener ← _ScrollableScope ← _ScrollSemantics-[GlobalKey#6c13c] ←
    NotificationListener<ScrollMetricsNotification> ← RepaintBoundary ←
    CustomPaint-[GlobalKey#530aa]
    ← ⋯
  parentData: <none> (can use size)
  constraints: BoxConstraints(0.0<=w<=500.0, 0.0<=h<=636.0)
  size: MISSING
The constraints that applied to the RenderConstrainedBox were:
  BoxConstraints(0.0<=w<=480.0, 0.0<=h<=Infinity)
The exact size it was given was:
  Size(480.0, Infinity)
See https://flutter.dev/docs/development/ui/layout/box-constraints for more information.        

The relevant error-causing widget was:
  HtmlElementView
  HtmlElementView:file:///C:/Users/mounir/AppData/Local/Pub/Cache/hosted/pub.dartlang.org/web_no  de-0.2.1/lib/src/web_node_impl_browser.dart:41:25

When the exception was thrown, this was the stack:
C:/b/s/w/ir/cache/builder/src/out/host_debug/dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 251:49  throw_
packages/flutter/src/rendering/box.dart 2203:9
<fn>
packages/flutter/src/rendering/box.dart 2296:14
debugAssertDoesMeetConstraints
packages/flutter/src/rendering/box.dart 1989:7
<fn>
packages/flutter/src/rendering/box.dart 1990:14
set size
packages/flutter/src/rendering/proxy_box.dart 280:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/shifted_box.dart 233:5
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/layout_helper.dart 56:10
layoutChild
packages/flutter/src/rendering/flex.dart 829:43
[_computeSizes]
packages/flutter/src/rendering/flex.dart 931:32
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/shifted_box.dart 437:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/widgets/single_child_scroll_view.dart 504:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/custom_paint.dart 545:11
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/shifted_box.dart 437:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/custom_layout.dart 171:10
layoutChild
packages/flutter/src/material/scaffold.dart 1005:7
performLayout
packages/flutter/src/rendering/custom_layout.dart 240:7
[_callPerformLayout]
packages/flutter/src/rendering/custom_layout.dart 403:14
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/proxy_box.dart 1376:11
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1707:7
[_layoutWithoutResize]
packages/flutter/src/rendering/object.dart 879:17
flushLayout
packages/flutter/src/rendering/binding.dart 497:19
drawFrame
packages/flutter/src/widgets/binding.dart 883:13
drawFrame
packages/flutter/src/rendering/binding.dart 363:5
[_handlePersistentFrameCallback]
packages/flutter/src/scheduler/binding.dart 1145:15
[_invokeFrameCallback]
packages/flutter/src/scheduler/binding.dart 1082:9
handleDrawFrame
packages/flutter/src/scheduler/binding.dart 996:5
[_handleDrawFrame]
C:/b/s/w/ir/cache/builder/src/out/host_debug/flutter_web_sdk/lib/_engine/engine/platform_dispatcher.dart 1005:13           invoke
C:/b/s/w/ir/cache/builder/src/out/host_debug/flutter_web_sdk/lib/_engine/engine/platform_dispatcher.dart 159:5             invokeOnDrawFrame
C:/b/s/w/ir/cache/builder/src/out/host_debug/flutter_web_sdk/lib/_engine/engine.dart 455:45     
<fn>

The following RenderObject was being processed when the exception was fired:
RenderConstrainedBox#63134 relayoutBoundary=up18 NEEDS-LAYOUT NEEDS-PAINT:
  creator: SizedBox.expand ← PlatformViewLink ← HtmlElementView ← WebNode ← Padding ←
  NsDescription ←
    Column ← Center ← _SingleChildViewport ← IgnorePointer-[GlobalKey#f6dcd] ← Semantics ←      
    Listener ←
    ⋯
  parentData: offset=Offset(0.0, 0.0) (can use size)
  constraints: BoxConstraints(0.0<=w<=480.0, 0.0<=h<=Infinity)
  size: Size(480.0, Infinity)
  additionalConstraints: BoxConstraints(biggest)
This RenderObject has no descendants.
════════════════════════════════════════════════════════════════════════════════════════════════════
Another exception was thrown: RenderPadding object was given an infinite size during layout.    
Another exception was thrown: RenderFlex object was given an infinite size during layout.       
Another exception was thrown: RenderPositionedBox object was given an infinite size during      
layout.
Another exception was thrown: PlatformViewRenderBox object was given an infinite size during
layout.
Another exception was thrown: PlatformViewRenderBox object was given an infinite size during
layout.
Another exception was thrown: RenderSemanticsAnnotations object was given an infinite size
during layout.
Another exception was thrown: RenderPadding object was given an infinite size during layout.
Another exception was thrown: RenderFlex object was given an infinite size during layout.
Another exception was thrown: RenderPositionedBox object was given an infinite size during
layout.
Another exception was thrown: PlatformViewRenderBox object was given an infinite size during
layout.
Another exception was thrown: PlatformViewRenderBox object was given an infinite size during
layout.
Another exception was thrown: RenderSemanticsAnnotations object was given an infinite size
during layout.
Another exception was thrown: RenderPadding object was given an infinite size during layout.
Another exception was thrown: RenderFlex object was given an infinite size during layout.
Another exception was thrown: RenderPositionedBox object was given an infinite size during
layout.

## List Tile layout issue

══╡ EXCEPTION CAUGHT BY RENDERING LIBRARY
╞═════════════════════════════════════════════════════════
The following assertion was thrown during performLayout():
Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/material/list_tile.dart:1777:7
tileWidth != trailingSize.width || tileWidth == 0.0
"Trailing widget consumes entire tile width. Please use a sized widget, or consider   
replacing
ListTile with a custom widget (see
https://api.flutter.dev/flutter/material/ListTile-class.html#material.ListTile.4)"    

The relevant error-causing widget was:
  ListTile
  ListTile:file:///C:/NouriSolutions/trunk2022/flutter/ns_demo/lib/app/object/preferen  ces.dart:45:20

When the exception was thrown, this was the stack:
C:/b/s/w/ir/cache/builder/src/out/host_debug/dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 251:49  throw_
C:/b/s/w/ir/cache/builder/src/out/host_debug/dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 29:3    assertFailed
packages/flutter/src/material/list_tile.dart 1777:55
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/shifted_box.dart 233:5
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/shifted_box.dart 233:5
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/custom_paint.dart 545:11
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/proxy_box.dart 1376:11
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/shifted_box.dart 233:5
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/sliver_multi_box_adaptor.dart 487:12
insertAndLayoutChild
packages/flutter/src/rendering/sliver_list.dart 239:19
advance
packages/flutter/src/rendering/sliver_list.dart 281:12
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/sliver_padding.dart 137:5
performLayout
packages/flutter/src/rendering/sliver_padding.dart 371:11
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/viewport.dart 510:12
layoutChildSequence
packages/flutter/src/rendering/viewport.dart 1580:12
[_attemptLayout]
packages/flutter/src/rendering/viewport.dart 1489:20
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/custom_paint.dart 545:11
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/shifted_box.dart 437:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/custom_layout.dart 171:10
layoutChild
packages/flutter/src/material/scaffold.dart 1005:7
performLayout
packages/flutter/src/rendering/custom_layout.dart 240:7
[_callPerformLayout]
packages/flutter/src/rendering/custom_layout.dart 403:14
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/proxy_box.dart 1376:11
performLayout
packages/flutter/src/rendering/object.dart 1852:7
layout
packages/flutter/src/rendering/proxy_box.dart 116:7
performLayout
packages/flutter/src/rendering/object.dart 1707:7
[_layoutWithoutResize]
packages/flutter/src/rendering/object.dart 879:17
flushLayout
packages/flutter/src/rendering/binding.dart 497:19
drawFrame
packages/flutter/src/widgets/binding.dart 883:13
drawFrame
packages/flutter/src/rendering/binding.dart 363:5
[_handlePersistentFrameCallback]
packages/flutter/src/scheduler/binding.dart 1145:15
[_invokeFrameCallback]
packages/flutter/src/scheduler/binding.dart 1082:9
handleDrawFrame
packages/flutter/src/scheduler/binding.dart 996:5
[_handleDrawFrame]
C:/b/s/w/ir/cache/builder/src/out/host_debug/flutter_web_sdk/lib/_engine/engine/platform_dispatcher.dart 1005:13           invoke
C:/b/s/w/ir/cache/builder/src/out/host_debug/flutter_web_sdk/lib/_engine/engine/platform_dispatcher.dart 159:5             invokeOnDrawFrame
C:/b/s/w/ir/cache/builder/src/out/host_debug/flutter_web_sdk/lib/_engine/engine.dart  
455:45                                <fn>

The following RenderObject was being processed when the exception was fired:
_RenderListTile#24ad3 relayoutBoundary=up18 NEEDS-LAYOUT NEEDS-PAINT
NEEDS-COMPOSITING-BITS-UPDATE:
  creator: _ListTile ← MediaQuery ← Padding ← SafeArea ← Builder ←
  Padding-[GlobalKey#c5520] ← Ink ←
    Semantics ← Listener ← RawGestureDetector ← GestureDetector ← Semantics ← ⋯       
  parentData: offset=Offset(0.0, 0.0) (can use size)
  constraints: BoxConstraints(w=460.0, 0.0<=h<=Infinity)
  size: MISSING
This RenderObject had the following descendants (showing up to depth 5):
    leading: RenderParagraph#f6393 relayoutBoundary=up19 NEEDS-PAINT
      text: TextSpan
    title: RenderParagraph#ea1e3 NEEDS-LAYOUT NEEDS-PAINT
      text: TextSpan
    trailing: RenderParagraph#d8b92 relayoutBoundary=up19 NEEDS-PAINT
      text: TextSpan
════════════════════════════════════════════════════════════════════════════════════════════════════
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/box.dart:1927:12
Another exception was thrown: Assertion failed:
file:///C:/NouriSolutions/Tools/flutter/packages/flutter/lib/src/rendering/sliver_multi_box_adaptor.dart:544:12
Another exception was thrown: Unexpected null value.
Another exception was thrown: Unexpected null value.
Another exception was thrown: Unexpected null value.

