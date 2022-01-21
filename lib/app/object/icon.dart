import 'package:flutter/material.dart';
import '../../serializables/app_object.dart';

class NsIcon extends StatelessWidget{
  final NsAppObject? object;
  const NsIcon({Key? key,  required this.object}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  getObjectImage();
  }

  getObjectImage() {
    if (object != null && object?.imageUrl != null  )  {
      var imgUrl = object?.imageUrl as String;
      if (imgUrl.isNotEmpty){
        return Image.network(imgUrl, width: 80, height: 60);
      }
    }
    return const Image(image: AssetImage('image/object-no-image.png'), height: 60);
  }
}