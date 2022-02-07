
import 'package:flutter/material.dart';

class NsHeading1 extends StatelessWidget {
  final String text;
  const NsHeading1(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.subtitle1;
    return 
      Text(text, style: style);
  }
}


class NsHeading2 extends StatelessWidget {
  final String text;
  const NsHeading2(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.subtitle2;
    return 
      Text(text, style: style);
  }
}
