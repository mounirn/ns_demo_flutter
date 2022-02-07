
import 'package:flutter/material.dart';
import 'package:ns_demo/app/object/desc.dart';
import 'package:ns_demo/widgets/heading.dart';
import 'package:ns_demo/widgets/record_item.dart';
import 'package:provider/provider.dart';

import '../../app/object/header.dart';
import '../../app/widgets/divider.dart';
import '../../serializables/app_type.dart';
import '../../providers/settings_data.dart';

/// Displays information about the type class for the selected client
/// if client does not implement this class, it displays the system client class info 
class NsTypeClassWidget extends StatelessWidget {
  final NsAppType type;
  const NsTypeClassWidget(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsModel = context.read<NsAppSettingsData>();
    var client = settingsModel.getMainSystemtClientDetails();

    return SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NsHeading1("Type Information"),
            NsRecordItem('ID: ', type.id),
            NsRecordItem('Type Id:', type.typeId),
            const NsHeading2("Description"),
            NsDescription(type),
            NsDivider(settingsModel),
            const NsHeading2("Main System Organization"),
            if (client != null )
              NsHeader(object: client) ,
          ],
        )
    );
  }
}
