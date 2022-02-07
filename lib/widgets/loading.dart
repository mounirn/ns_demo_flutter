
import 'package:flutter/material.dart';
import '../providers/settings_data.dart';

/// A Widget that display the result of processing
class NsLoadingWidget extends StatelessWidget {
  final String title;
  const NsLoadingWidget(this.title, {Key? key, NsAppSettingsData? settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return 
        Card( 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const CircularProgressIndicator(),
                title: const Text("Loading..."),
                subtitle: Text(title)
              ),
            ]
          )
        )
      ;
  }
}