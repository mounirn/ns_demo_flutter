import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
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
        child: WebNode(
          backgroundColor: Colors.lightGreen,   
          node: getHtmlElement(),
        ),
      )
      )
   ;
  }

  getHtmlElement() {
    if (object != null && object?.description != null  )  {
      return html.DivElement()
        ..innerHtml = object?.description
        ..style.backgroundColor = 'lightyellow'
        ..style.padding = '10px'
        ..style.color = 'black'
        ..style.textAlign = 'center'
        ..style.width = '100%'
        ..style.height = '300px';
    } else {
      return html.DivElement()
        ..style.textAlign = 'center'
        ..style.height = '300px'
        ..append(
          html.HeadingElement.h1()..appendText('Edit'),
        );
    }
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
  /// Identifies the object color based on its colors props
  /// If it has color props use parent client props
  Color getHeaderBackgroundColor(){
    return Colors.deepPurple;
  }

  /// Identifies the object text color based on its colors props
  /// If it has no color props use parent client props
  Color getHeaderTextColor(){
    return Colors.white;
  }

  getObjectImage() {
    if (object != null && object?.imageUrl != null  )  {
      var imgUrl = object?.imageUrl as String;
      if (imgUrl.isNotEmpty){
        return Image.network(imgUrl, width: 80, height: 60);
      }
    }
    return const Image(image: AssetImage('/image/object-no-imge.png'));
  }

  String getName(){
    if (object?.name != null){
      return object?.name as String;
    }
    else{
      return "?";
    }
  }
}