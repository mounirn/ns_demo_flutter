import 'package:flutter/material.dart';
import 'package:ns_demo/utils/color_utils.dart';
import '../../providers/settings_data.dart';


// Builds an warning box with display
class NsWarning extends StatelessWidget {
  final String data;  // the text to display
  const NsWarning(this.data, {Key? key, NsAppSettingsData? settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var client = settings?.getSelectedClientDetails();
      return 
        Container( padding: const EdgeInsets.all(8), 
          margin: const EdgeInsets.all(8) ,
          color: NsColorUtils.yellow,
          child: Text(data, 
            style: const TextStyle(color: Colors.red) 
          )
        )
      ;
  }
}