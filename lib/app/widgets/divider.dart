// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ns_demo/utils/color_utils.dart';
import '../../providers/settings_data.dart';

class NsDivider extends StatelessWidget {
  final NsAppSettingsData? data;
  const NsDivider(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = data?.getSelectedClientDetails(); 

    return Divider(color: NsColorUtils.getBorderColor(client), height: 10);
    
  }
}
 