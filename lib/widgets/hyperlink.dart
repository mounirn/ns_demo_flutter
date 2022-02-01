

import 'package:flutter/material.dart';
import 'package:ns_demo/utils/consts.dart';
import 'package:url_launcher/url_launcher.dart';


class NsHyperLink extends StatelessWidget {
  final String url;
  final String label;
  const NsHyperLink(this.url, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final appContainer = html.document.getElementsByTagName('body')[0] as html.Element;
    var hyperLinkStyle = NsConsts.C_HyperLinkStyle;
    
    return 
      DefaultTextStyle(
        style: hyperLinkStyle, 
        child: Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0,
          children: [
            GestureDetector(
              child: Text(label, 
                style: hyperLinkStyle
              ),
              onTap: _onClick
            )
          ],
        )
      );
  }

  _onClick() async {
    var ok = await canLaunch(url);
    if (ok) {
      await launch(url);
    }
    
  }
}
