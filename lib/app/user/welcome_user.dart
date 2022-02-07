// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../providers/user.dart';


class NsUserWelcome extends StatelessWidget {
  final NsUserModel? data;
  const NsUserWelcome(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? name = "Guest";
    if (data!= null && data?.session!= null){
      name = data?.session?.fullName;
    }
    var style = Theme.of(context).textTheme.headline2;
    return Padding(padding: EdgeInsets.all(10),
      child: Wrap(
        children: [ 
          Text("Welcome ",style: style),
          if (name != null)
            Text(name, style: style) ,
         
        ],
      )
    );
  }
}
 