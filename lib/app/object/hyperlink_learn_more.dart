

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../serializables/app_object.dart';
import '../../utils/consts.dart';


// displays a learn more hyperlink for the given object
class NsHyperLinkLearnMore extends StatelessWidget {
  final NsAppObject object;
  const NsHyperLinkLearnMore(this.object, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hyperLinkStyle = NsConsts.C_HyperLinkStyle;
  
    return 
      TextButton( 
        onPressed: _onClick, 
        child: Text("Learn More", style: hyperLinkStyle),
      
      );
  }

  _onClick() async {
    /// TODO: add configuration for label and url
    var url = 'https://myonlineobjects.com/object/display/${object.systemId}';
    var ok = await canLaunch(url);
    if (ok) {
      await launch(url);
    }
    
  }
}
