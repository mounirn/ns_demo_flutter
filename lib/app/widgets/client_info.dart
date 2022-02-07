import 'package:flutter/material.dart';
import 'package:ns_demo/widgets/hyperlink.dart';

import '../../providers/user.dart';
import '../../providers/settings_data.dart';
import '../../app/object/logo.dart';
import '../../app/object/title.dart';
import '../../app/object/desc.dart';
import '../../app/object/notes.dart';
import 'divider.dart';

class NsClientInfoWidget extends StatelessWidget {
  final NsAppSettingsData? settings; 
  final NsUserModel? user;

  const NsClientInfoWidget(this.settings, {Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = settings?.getSelectedClientDetails();
    
    if (client != null) {
      return SingleChildScrollView (
        child: Center (
          child: Column(
            children: [ 
              NsLogo(client),
              NsTitle(client),  
              NsDivider(settings),
              NsDescription(client),
              NsDivider(settings), 
              // display options if the user has permission
              // NsPrefencesWidget(client, settings, user)
              NsNotes(client, settings: settings),
              NsDivider(settings), 
              NsHyperLink('https://myonlineobjects.com/client/display/${client.systemId}', "Learn More")
            ],
          )
        )
      );
    } else {
      return 
        const Text("Please Select Client in Settings", style: TextStyle(color: Colors.red),);
    }
  }
}
 