
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
// import '../providers/config_data.dart';
import '../providers/settings_data.dart';
import '../widgets/card_check.dart';
import '../widgets/result.dart';

import 'home_tabs.dart';
/// Displays a loading screen
class NsAppLoadingScreen extends StatelessWidget {
  const NsAppLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsModel = context.watch<NsAppSettingsData>();
    var loadedConfigOk = settingsModel.configData != null;
    var loadedClientsOk = settingsModel.participatingClients != null;

    if (loadedConfigOk && loadedClientsOk){
      return const NsHomeScreenWithBottomTabs();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading...'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView( 
        child: Container (
          color: Colors.yellow,
          child: Column(
            children: <Widget>[
                NsCardCheck(loadedConfigOk, "Loaded Config"),
                const Divider(height: 4, thickness: 2, color: Colors.black),
                NsCardCheck(loadedClientsOk, "Loaded Clients - count: ${settingsModel.participatingClients?.length}"),
                const Divider(height: 4, thickness: 2, color: Colors.black),
                NsResultWidget(settingsModel.lastResult),
                const Divider(height: 4, color: Colors.black),
                const SizedBox(height: 80.0, 
                  child:
                    Image(image: AssetImage('assets/image/logo.png') ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
