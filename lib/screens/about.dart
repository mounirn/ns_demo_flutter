import 'package:flutter/foundation.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


import '../providers/config_data.dart';
import '../widgets/record_item.dart';
//import '../widgets/messages.dart';

/// Displays an about screen including the following information
/// - App Startup Status
/// - Info loaded from config (app name, developer, app version etc.)
/// - App Messages
class NsAppAboutScreen extends StatelessWidget {
  const NsAppAboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var configModel = context.read<NsAppConfigData>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('About This App'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,

              children:  [
                getAppName(configModel, context),  
                getAppVersion(configModel, context), 
                
                const Divider(height: 4, color: Colors.black),
                getAppDescription(configModel, context),
                const Divider(height: 4, color: Colors.black),
                NsRecordItem("Target Platform", defaultTargetPlatform.toString()),
                NsRecordItem("Screen Width", screenWidth.toString()),
                NsRecordItem("Screen Height", screenHeight.toString()),
                const Divider(height: 4, color: Colors.black),
                // const NsAppMessagesWidget(),
              ],
            )
          ),
      ),
    );
  }

  
  Text getAppName(NsAppConfigData model, BuildContext context) {
    if (model.config == null) {
      return const Text("Invalid Config", style: TextStyle(color: Colors.red));
    }
    return Text(model.config?.appName ?? 'NS Objects', 
      style: const TextStyle(color: Colors.green, 
        fontSize: 28, fontWeight: FontWeight.bold));
  }

  Text getAppVersion(NsAppConfigData model, BuildContext context) {
    if (model.config == null) {
      return const Text("Invalid Config", style: TextStyle(color: Colors.red));
    }
    return Text("Version " + (model.config?.appVersion ?? '0.0.1'), 
      style: const TextStyle(color: Colors.blue, 
        fontSize: 18, fontWeight: FontWeight.bold));
  }
  
  Widget getAppDescription(NsAppConfigData model, BuildContext context) {
    if (model.config == null) {
      return const Text("Invalid Config", style: TextStyle(color: Colors.red));
    }
    return 
      Padding(padding: const EdgeInsets.all(10), child: Center( 
        child: 
          Text(model.config?.description ?? '<edit description in config.json>', 
            style: const TextStyle(color: Colors.black, 
              fontSize: 16, fontWeight: FontWeight.normal)
          )
      )
    );
  }

/*
  Wrap(spacing: 10, runSpacing: 10,
                  children: [
                   
                  ]
                )
 */

}
