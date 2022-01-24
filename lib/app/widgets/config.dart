import 'package:flutter/material.dart';
import 'package:ns_demo/providers/config_data.dart';
import 'package:provider/provider.dart';
import '../../widgets/object/config_item.dart';

class NsAppConfigWidget extends StatelessWidget {
  const NsAppConfigWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<NsAppConfigData>();
   
    
    return Column(children: [
      NsAppConfigItem("App Server Url", model.getServerUrlFromConfig(), ),
      NsAppConfigItem("Objects API Uri", model.getApiRootUrl(), ),
    ],
    );
  }
}


