import 'package:flutter/material.dart';
import '../../app/object/header.dart';

import '../../providers/settings_data.dart';
import 'divider.dart';

class NsClientInfoWidget extends StatelessWidget {
  final NsAppSettingsData? data; 
  const NsClientInfoWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = data?.getSelectedClientDetails();

    if (client != null) {
      return Column(
        children: [ 
          NsDivider(data),
          NsHeader(object: client),  
        ],
      );
    } else {
      return 
        const Text("Please Select Client in Settings", style: TextStyle(color: Colors.red),);
    }
  }
}
 