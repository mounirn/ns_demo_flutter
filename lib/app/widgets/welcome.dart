// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../app/object/header.dart';
import '../../providers/settings_data.dart';
import 'divider.dart';

class NsAppWelcome extends StatelessWidget {
  final NsAppSettingsData? data;
  const NsAppWelcome(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = data?.getSelectedClientDetails();
 
    return Column(
        children: [ 
          NsDivider(data),
          if (client != null )
            NsHeader(object: client) ,
        ],
      );
    
  }
}
 