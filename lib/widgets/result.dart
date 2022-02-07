import 'package:flutter/material.dart';
import '../../services/result.dart';
import '../../providers/settings_data.dart';


/// A Widget that display the result of processing
class NsResultWidget extends StatelessWidget {
  final NsResult? result;   // the result to display
  const NsResultWidget(this.result, 
    {Key? key, NsAppSettingsData? settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return Container();
    }
    return 
        Card( 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(result?.status == 0 ? Icons.check: Icons.error),
                title: Text(result?.error ?? ''),
                subtitle: Text(getExceptionString())
              ),
            ]
          )
        )
      ;
  }

  getExceptionString() {
    if (result == null || result?.exception == null){
      return '';
    }
    return result?.exception?.toString();
  }
}
