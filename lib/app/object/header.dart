import 'package:flutter/material.dart';
import 'package:ns_demo/utils/color_utils.dart';
import '../../serializables/app_object.dart';
import 'icon.dart';

class NsHeader extends StatelessWidget{
  final NsAppObject? object;
  const NsHeader({Key? key,  required this.object}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container( 
    padding: const EdgeInsets.all(10), 
    color: getHeaderBackgroundColor(),
    child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
       NsIcon(object: object), 
       Expanded(
        child:Text(getName(), 
         maxLines: 1, 
         overflow: TextOverflow.ellipsis, 
         style: TextStyle( 
           fontSize: 36,
           fontWeight: FontWeight.bold,
           color: getHeaderTextColor()
         ),
         textAlign: TextAlign.center,
        )
       )
     ])
   );
  }

  /// Identifies the object color based on its colors props
  /// If it has color props use parent client props
  Color getHeaderBackgroundColor(){
    return NsColorUtils.getHeaderBackgroundColor(object);
  }

  /// Identifies the object text color based on its colors props
  /// If it has no color props use parent client props
  Color getHeaderTextColor(){
    return NsColorUtils.getHeaderColor(object);
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
