
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:web_node/web_node.dart';


/// Display a privacy policy web page 
/// if url is supplied the url is used instead of a default URL
class NsAppPrivacyWidget extends StatelessWidget{
  final String? url;
  const NsAppPrivacyWidget({Key? key, this.url }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _firstNavigate = true;
    if (defaultTargetPlatform == TargetPlatform.android 
        || defaultTargetPlatform == TargetPlatform.iOS ) {
      return WebView(initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) async {
          if (_firstNavigate) {
            _firstNavigate = false;
            return NavigationDecision.navigate;
          }else {
            await launch(request.url);
            return NavigationDecision.prevent;
          }
        },
      );
    }
    else {
      return Center( 
          child: 
        ElevatedButton (
         onPressed: () => launchURL(),
         child: const Text("View")
        )
      );
    }
  }


  onWebResourceError(WebResourceError error) {

  }

  getUrl() {
    if (url == null) {
      return "https://myOnlineObjects.com/home/privacy";
    } else {
      return url;
    }
  }

  launchURL() async {
    var _url = getUrl();
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      // error handling 
      throw 'Unable to launch $_url';
    }
  }

  /*
   Column( mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        LimitedBox( maxHeight: 300, maxWidth: 600,
          child: Padding (
            padding: const EdgeInsets.all(10), 
              child: WebNode(   
                node: getHtmlElement(),
              )
            )
          )
      ]) 
  */
  
  html.HtmlElement getHtmlElement() {
      final h1 = html.HeadingElement.h1();
      h1.appendText('App Privacy Poilicy');
      h1.style.color = 'black';

      final iframe = html.IFrameElement();
      iframe.src = url ?? 'https://myOnlineObjects.com/home/privacy';

      final div = html.DivElement()
      ..style.width = '500px'
      ..style.height = '300px'
      ..append(h1)
      ..append(iframe);

      return div;
  }
}