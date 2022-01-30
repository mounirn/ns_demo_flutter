import 'package:flutter/material.dart';
import '../../serializables/app_object.dart';

class NsIcon extends StatelessWidget{
  final NsAppObject? object;
  const NsIcon({Key? key,  required this.object}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  getObjectImage() ;
  }

  getObjectImage() {
    if (object != null && object?.imageUrl != null  )  {
      var imgUrl = object?.imageUrl as String;
      if (imgUrl.isNotEmpty){
        return Image.network(imgUrl, width: 60, height: 40, fit: BoxFit.scaleDown,
          semanticLabel: object?.name,);
      }
    }
    return Image(image:  const AssetImage('assets/image/object-no-image.png'), 
      height: 40, fit: BoxFit.scaleDown, semanticLabel: object != null? object?.name : '');
  }
}