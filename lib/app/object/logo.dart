import 'package:flutter/material.dart';
import '../../serializables/app_object.dart';
import '../../utils/consts.dart';

class NsLogo extends StatelessWidget{
  final NsAppObject? object;
  const NsLogo(this.object, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  getObjectImage();
  }

  getObjectImage() {
    if (object != null && object?.imageUrl != null  )  {
      var imgUrl = object?.imageUrl as String;
      if (imgUrl.isNotEmpty){
        return Padding(padding: const EdgeInsets.all(8), 
          child: Image.network(imgUrl, width: 120, 
            height: 80, fit: BoxFit.scaleDown,
            semanticLabel: object?.name,
          )
        );
      }
    }
    return Padding(padding: const EdgeInsets.all(8), 
      child: 
        Image(image:  const AssetImage(NsConsts.C_NsObjectNoImage), 
          height: 80, 
          fit: BoxFit.scaleDown, 
          semanticLabel: object != null? object?.name : ''
        )
    );
  }
}