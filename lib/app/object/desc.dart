import 'package:flutter/material.dart';
import '../../serializables/app_object.dart';

class NsDescription extends StatelessWidget{
  final NsAppObject? object;
  const NsDescription({Key? key,  required this.object}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding( 
     padding: const EdgeInsets.all(10), 
     child: Row(
        children: [
        getObjectImage(),
        Text(getName(), 
          maxLines: 1, 
          overflow: TextOverflow.ellipsis, 
          style: TextStyle(
            backgroundColor: getHeaderBackgroundColor(), 
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: getHeaderTextColor()
            ),
          textAlign: TextAlign.center,
        )
      ])
   );
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