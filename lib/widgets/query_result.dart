import 'package:flutter/material.dart';
import 'package:ns_demo/utils/color_utils.dart';

import '../serializables/app_query_result.dart';
import '../../providers/settings_data.dart';


/// A Widget that display the result of the processing a query
class NsQueryResultWidget extends StatelessWidget {
  final NsAppObjectQueryResult result;   // the result to display
  const NsQueryResultWidget(this.result, 
    {Key? key, NsAppSettingsData? settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
        Card( 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(result.success == true ? Icons.check: Icons.error,
                color: getColor()),
                title: Text(getTitle()),
                subtitle: Text(getDetails())
              ),
            ]
          )
        )
      ;
  }

  Color getColor() {
    if (result.success == true) {
      return NsColorUtils.green;
    }
    return NsColorUtils.red;
  }
  String getTitle() {
    if (result.success == true) {
      return "Success";
    }
    return "Error Status: ${result.status}";
    
  }
  String getDetails() {
      return 'Details: ${result.toString()}';
  }
}
