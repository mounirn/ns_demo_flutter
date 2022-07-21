import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:universal_html/html.dart' as html;

// import 'package:web_node/web_node.dart';

import '../../app/object/html_view.dart';
import '../../providers/app_messages.dart';
import '../../providers/settings_data.dart';

import '../../serializables/app_object.dart';
import '../../models/object_helper.dart';

/// Displays any notes stored in preferences
/// 
class NsNotes extends StatelessWidget{
  final NsAppSettingsData? settings;
  final NsAppObject? object;
  final double maxHeight;
  final String backgroundColor;
  const NsNotes(this.object, {Key? key, 
    this.settings,
    this.maxHeight = 200, 
    this.backgroundColor = 'lightyellow'}) 
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return 
      LimitedBox( maxHeight: maxHeight,
        child: Padding (
          padding: const EdgeInsets.all(10), 
          child: getView(context),
        ),
      )
    ;
  }

  /// Identifies whether target platform is iOS or Android and returns A web view
  /// or Web node
  getView(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS){
      return getWebView(context);
    } else {
      return getWebHtmlView(context);
    }
  }

  getWebHtmlView(BuildContext context) {
    return NsHtmlContentView(getHtmlDocumentBody());
  } 

/* 
  getWebNode(BuildContext context) {
    return WebNode(
      backgroundColor: Colors.lightGreen,   
      node: getHtmlElement() );
  }
*/

  getWebView(BuildContext context) {
    var messages = context.read<NsAppMessages>();
    final uri = Uri.dataFromString(
      getHtmlDocumentBody(),
      mimeType: 'text/html',
    );
    return WebView(
      initialUrl: uri.toString(),
      javascriptMode: JavascriptMode.unrestricted,
      userAgent: "Ns Flutter Client",
      initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      gestureNavigationEnabled: true,
      onWebResourceError: (error) {
        messages.addError('${error.errorCode} - ${error.description} - ${error.failingUrl}');
      },
    );
  }

  NsAppObjectPreference? getPref(String key) {
    return object?.getPref(key);
  }

  String getHtmlDocumentBody() {
    var pref = getPref('Notes');
    if (pref  != null  )  {
  /*    var p = parser.HtmlParser(pref.value);
      var doc = p.parse();
      var body = doc.body;
      var innerHtml = body?.innerHtml;
      return innerHtml ?? '';
    */
      return pref.value ?? '';
    } 
    else {
      return '';
    }
  }

}