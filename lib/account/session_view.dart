import 'package:flutter/material.dart';
import '../../serializables/user_session.dart';

class NsSessionView extends StatelessWidget{
  final NsUserSession? object;
  const NsSessionView(this.object, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  Column(children: [
     getObjectImage(),
     Text(getUserName()),
     const Divider(height: 5, color: Colors.amber),
     if (object != null)
      Row(children:  [
       const Text("Last Access: "),
       Text(getLastAccess())
     ],)
   ]);
  }

  
  getUserName() {
    if (object != null) {
      return object?.fullName;
    } else {
      return "Guest";
    }
  }

  getLastAccess() {
    if (object == null) {
      return '';
    }

    if (object?.lastAccess == null){
      return '?';
    }
    return object?.lastAccess?.toString();
  }

  getObjectImage() {
    if (object != null && object?.imageUrl != null  )  {
      var imgUrl = object?.imageUrl as String;
      if (imgUrl.isNotEmpty){
        return Image.network(imgUrl, width: 120, height: 80, fit: BoxFit.scaleDown,
          semanticLabel: object?.fullName,);
      }
    }
    return Image(image:  const AssetImage('image/object-no-image.png'), 
      height: 80, fit: BoxFit.scaleDown, semanticLabel: object != null? object?.fullName : '');
  }
}