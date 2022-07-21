import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/hyperlink.dart';
import '../../providers/settings_data.dart';
import '../object/logo.dart';
import '../object/title.dart';
import '../object/desc.dart';
import '../object/notes.dart';
import '../widgets/divider.dart';

class NsClientInfoWidget extends StatelessWidget {

  const NsClientInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settings = context.watch<NsAppSettingsData>();

    var client = settings.getSelectedClientDetails();
    
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
 