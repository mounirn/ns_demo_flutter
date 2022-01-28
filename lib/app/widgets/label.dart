// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ns_demo/utils/color_utils.dart';
import '../../providers/settings_data.dart';

class NsLabel extends StatelessWidget {
  final String title;
  final NsAppSettingsData? data;
  const NsLabel(this.title, {Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title, 
      style: TextStyle(
          fontSize: 18, 
          color: NsColorUtils.getHeaderColor(data?.getSelectedClientDetails()),
          fontWeight: FontWeight.bold),
      );
    
  }
}
 