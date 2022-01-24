import 'package:flutter/cupertino.dart';
import '../../utils/color_utils.dart';
import '../../serializables/app_object.dart';

/// A row view of the basic object info
class NsRow extends StatelessWidget{
  const NsRow(this.item, {Key? key}) : super(key: key);
  final NsAppObject item;
  @override
  Widget build(BuildContext context) {
   
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
                    color: NsColorUtils.getHeaderColor(item),
                  ) :
                  Image.network(item.imageUrl!)
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name!),
            ),
            const SizedBox(width: 24),
          //  _SelectButton(item: item),
          ],
        ),
      ),
    );
  }
}