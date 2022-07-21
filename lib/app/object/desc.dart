import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ns_demo/widgets/warning.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
//import 'package:html/parser.dart' as parser;
// import 'package:universal_html/html.dart' as html;

import 'package:ns_demo/app/object/html_view.dart';
import '../../providers/app_messages.dart';
// import 'package:web_node/web_node.dart';
import '../../serializables/app_object.dart';
import '../../models/object_helper.dart';

/// Displays the object description content:
/// - Uses HtmlView for Web target
/// - Uses WebView for Android or IOS
class NsDescription extends StatelessWidget{
  final NsAppObject? object;
  final double maxHeight;
  const NsDescription(this.object,  {Key? key, this.maxHeight = 300}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (object == null) {
      return const NsWarning("NsDescription: Invalid Object");
    }
    return 
      LimitedBox( maxHeight: maxHeight, maxWidth: 600,
        child: 
        Padding (
          padding: const EdgeInsets.all(10), 
          child: getView(context),
        )
      )
    ;
  }

  /// Identifies whether target platform is iOS or Android and returns A web view
  /// or Web node
  getView(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS){
      // return getWebView(context);
      getWebView(context);
    } else {
      return getWebHtmlView(context);
    }
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

  getWebHtmlView(BuildContext context) {
    return NsHtmlContentView(getHtmlDocumentBody());
  } 

  String getHtmlDocumentBody() {
    var ret = '';
    if (object != null) {
      ret = object?.htmlContent ?? '';
    }
    return ret;
  }
 /*
  getHtmlElement() {
    var body = getHtmlDocumentBody();
   return html.DivElement()
        ..innerHtml = body
        ..style.backgroundColor = 'lightyellow'
        ..style.padding = '10px'
        ..style.color = 'black'
        ..style.textAlign = 'center'
        ..style.width = '100%'
        ..style.height = '100px'
        ..style.overflowY = 'scroll'
        // ..style.maxHeight = '300px'
        ;
  }

  getHtmlElementSample() {
    return html.DivElement()
        ..style.textAlign = 'center'
        ..append(
          html.HeadingElement.h1()..appendText('Hello world!'),
        )
        ..append(html.AnchorElement()
          ..href = 'https://dart.dev/'
          ..appendText('A link to dart.dev'));
          
  }
  */
}