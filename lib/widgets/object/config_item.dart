

import 'package:flutter/material.dart';

class NsAppConfigItem extends StatelessWidget {
  final String label;
  final dynamic value;
  const NsAppConfigItem(this.label, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingStyle =
        Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18);

    return Column(children: [
      Text(label, style: settingStyle), 
      Text(value.toString()),
      const Divider(height : 10, color:  Color(0xFFEAA400)),
    ]
    )
    ;
  }
}
