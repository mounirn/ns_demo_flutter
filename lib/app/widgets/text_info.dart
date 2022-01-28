import 'package:flutter/material.dart';
import '../../providers/settings_data.dart';


// Builds an informational text
class NsTextInfo extends StatelessWidget {
  final String data;  // the text to display
  const NsTextInfo(this.data, {Key? key, NsAppSettingsData? settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var client = settings?.getSelectedClientDetails();
      return 
        Container( padding: const EdgeInsets.all(8), 
          margin: const EdgeInsets.all(8) ,
          child: Text(data, 
            style: const TextStyle(color: Colors.blue) 
          )
        )
      ;
  }
}