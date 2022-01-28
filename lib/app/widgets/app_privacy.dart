import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_node/web_node.dart';


/// Display a privacy policy web page 
/// if url is supplied the url is used instead of a default URL
class NsAppPrivacyWidget extends StatelessWidget{
  final String? url;
  const NsAppPrivacyWidget({Key? key, this.url }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView( child: 
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
    );
  }
  
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