import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:html/parser.dart' as parser;
import 'package:webview_flutter/webview_flutter.dart';

import '../../providers/app_messages.dart';
import 'package:web_node/web_node.dart';
import '../../serializables/app_object.dart';

class NsDescription extends StatelessWidget{
  final NsAppObject? object;
  const NsDescription(this.object, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return 
      LimitedBox( maxHeight: 300, maxWidth: 600,
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
      return getWebNode(context);
    }
  }

  getWebNode(BuildContext context) {
    return WebNode(
      backgroundColor: Colors.lightGreen,   
      node: getHtmlElement() );
  }

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


  String getHtmlDocumentBody() {
    if (object != null && object?.description != null  )  {
      var p = parser.HtmlParser(object?.description);
      var doc = p.parse();
      var body = doc.body;
      var innerHtml = body?.innerHtml;
      return innerHtml ?? '';
    } 
    else {
      return '';
    }
  }

  getHtmlElement() {
    var body = getHtmlDocumentBody();
    return html.DivElement()
        ..innerHtml = body
        ..style.backgroundColor = 'lightyellow'
        ..style.padding = '10px'
        ..style.color = 'black'
        ..style.textAlign = 'center'
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.maxHeight = '300px';
  }
/*
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