import 'package:flutter/material.dart';
import 'package:ns_demo/utils/color_utils.dart';
import '../../serializables/app_object.dart';

/// Display an object title (code and name) centered
/// in the format {code} {name}
class NsTitle extends StatelessWidget{
  final NsAppObject? object;
  const NsTitle(this.object, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container( 
    padding: const EdgeInsets.all(10), 
    color: getHeaderBackgroundColor(),
    child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
       Expanded(
        child:Text(getCodeAndName(), 
         maxLines: 1, 
         overflow: TextOverflow.ellipsis, 
         style: TextStyle( 
           fontSize: 26,
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


  String getCodeAndName(){
   
    return '${object?.code} ${object?.name }'.trim();
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