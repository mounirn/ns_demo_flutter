import 'package:flutter/material.dart';
import 'package:ns_demo/utils/color_utils.dart';
import '../../serializables/app_object.dart';
import 'icon.dart';

class NsDropdownItem extends StatelessWidget{
  final NsAppObject object;
  const NsDropdownItem(this.object, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding( 
     padding: const EdgeInsets.all(10), 
     child: Row(
        children: [
        NsIcon(object: object),
        Text(getName(), 
          maxLines: 1, 
          overflow: TextOverflow.ellipsis, 
          style: TextStyle(
            backgroundColor: getTextBackgroundColor(), 
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: getTextColor()
          ),
          textAlign: TextAlign.center,
        )
      ])
   );
  }

  /// Identifies the object color based on its colors props
  /// If it has color props use parent client props
  Color getTextBackgroundColor(){
    return NsColorUtils.getTextBackgroundColor(object);
  }

  /// Identifies the object text color based on its colors props
  /// If it has no color props use parent client props
  Color getTextColor(){
    return NsColorUtils.getTextColor(object);
  }

  String getName(){
    if (object.name != null){
      return object.name as String;
    }
    else{
      return "?";
    }
  }
}
