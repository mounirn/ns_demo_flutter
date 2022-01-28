import 'package:flutter/material.dart';
import '../../app/object/header.dart';
import '../../serializables/app_client.dart';

class NsClientInfoWidget extends StatelessWidget {
  final NsAppClientDetails? client;
  const NsClientInfoWidget(this.client, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (client != null) {
      return Column(
        children: [ 
          NsHeader(object: client),  
        ],
      );
    } else {
      return 
        const Text("Unknown Client", style: TextStyle(color: Colors.red),);
    }
  }
}
 