// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../app/client/drop_down.dart';

import '../../app/object/header.dart';
import '../../providers/settings_data.dart';

class NsAppWelcome extends StatelessWidget {
  final NsAppSettingsData? data;
  const NsAppWelcome(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = data?.getSelectedClientDetails();
 
    return Column(
        children: [ 
          NsClientsDropdown(data),
          Divider(thickness: 10, height: 5),
          client == null? 
            Text("Select Client", style: TextStyle(color: Colors.red),)
            :
            NsHeader(object: client) ,
        ],
      );
    
  }
}
 