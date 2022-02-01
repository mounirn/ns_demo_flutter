

import 'package:flutter/material.dart';
import 'package:ns_demo/utils/consts.dart';

import 'line.dart';

class NsRecordItem extends StatelessWidget {
  final String label;
  final dynamic value;
  const NsRecordItem(this.label, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var labelStyle = NsConsts.C_RecordLabelStyle;
    var valueStyle = NsConsts.C_RecordValueStyle;

    return 
        Column (
          children: [
            Padding( padding: const EdgeInsets.all(5), 
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: labelStyle, textAlign: TextAlign.right), 
                  Text(value.toString(), style: valueStyle, textAlign: TextAlign.right),
                ]
              )
            ), 
            const NsLine(),
          ]
        );
  }
}
