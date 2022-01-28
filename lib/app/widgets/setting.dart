// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../app/client/drop_down.dart';

import '../../providers/settings_data.dart';
import 'label.dart';

class NsAppSettingWidget extends StatelessWidget {
  final NsAppSettingsData? data;
  const NsAppSettingWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Column(
        children: [ 
          NsLabel("Selected Client: ", data: data),
          NsClientsDropdown(data),
       
        ],
      );
    
  }
}
 