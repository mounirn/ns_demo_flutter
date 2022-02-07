// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user/welcome_user.dart';
import '../object/header.dart';
import '../../providers/settings_data.dart';
import '../../providers/user.dart';
import 'divider.dart';

class NsAppWelcome extends StatelessWidget {
  final NsAppSettingsData? data;
  const NsAppWelcome(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = data?.getSelectedClientDetails();
    var user = context.read<NsUserModel>();
 
    return Column(
        children: [ 
          NsDivider(data),
          if (client != null )
            NsHeader(object: client) ,
          NsUserWelcome(user)
        ],
      );
    
  }
}
 