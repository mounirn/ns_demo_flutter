import 'package:flutter/material.dart';

import '../../providers/settings_data.dart';
import '../../app/object/logo.dart';
import '../../app/object/title.dart';
import '../../app/object/desc.dart';
import 'divider.dart';

class NsClientInfoWidget extends StatelessWidget {
  final NsAppSettingsData? settings; 
  const NsClientInfoWidget(this.settings, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = settings?.getSelectedClientDetails();

    if (client != null) {
      return Column(
        children: [ 
          NsLogo(client),
          NsTitle(client),  
          NsDivider(settings),
          NsDescription(client),
          NsDivider(settings), 
        ],
      );
    } else {
      return 
        const Text("Please Select Client in Settings", style: TextStyle(color: Colors.red),);
    }
  }
}
 