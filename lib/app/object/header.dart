import 'package:flutter/material.dart';
import 'package:ns_demo/utils/color_utils.dart';
import '../../serializables/app_object.dart';
import 'icon.dart';

class NsHeader extends StatelessWidget{
  final NsAppObject? object;
  const NsHeader({Key? key,  required this.object}) : super(key: key);

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

/* Sample code: 
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: 
                item.imageUrl == null || item.imageUrl!.isEmpty? 
                  Container(
                    color: Colors.blue,
                  ) :
                  Image.network(item.imageUrl!)
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name!, style: textTheme),
            ),
            const SizedBox(width: 24),
            _SelectButton(item: item),
          ],
        ),
      ),
    );
    */