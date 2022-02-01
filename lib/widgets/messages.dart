
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_messages.dart';

/// Displays the list of app messages logged
class NsAppMessagesWidget extends StatelessWidget{
  const NsAppMessagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<NsAppMessages>();
    var iterable = model.messages.reversed;
    List<Widget> widgets = [];
    for (var item in iterable) {
      widgets.add(getListItem(item, context));
    }
    
    return 
        ListView(
          children: widgets
        );
   
  }

  Widget getListItem(NsAppMessage item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: getColor(item.error),
              ),
            ),
            const SizedBox(width: 24),
            Text(item.time.toString()),
            const SizedBox(width: 18),
            Expanded(
              child: Text(item.message),
            ),
          ],
        ),
      ),
    );
  }
  
  getColor(bool? error) {
    if (error == null){
      return Colors.blue;
    } else if (error == true) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}