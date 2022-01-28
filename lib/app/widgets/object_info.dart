import 'package:flutter/material.dart';


import '../../providers/settings_data.dart';
import '../../serializables/app_object.dart';
import '../../app/object/title.dart';
import '../../app/object/logo.dart';
import '../../app/object/desc.dart';

import 'divider.dart';
import 'text_error.dart';

class NsAppObjectInfoWidget extends StatelessWidget {
  final NsAppObject? data; 
  final NsAppSettingsData? settings;
  const NsAppObjectInfoWidget(this.data, {Key? key, this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var client = settings?.getSelectedClientDetails();

    if (data != null) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [ 
            // NsDivider(data),
            NsLogo(data),
            NsTitle(data),  
            NsDivider(settings),
            NsDescription(data),
            NsDivider(settings),
          ],
        )
      ;
    } else {
      return 
        const NsTextError("Invalid");
    }
  }
}
 