import 'package:flutter/material.dart';
import 'package:ns_demo/app/widgets/app_privacy.dart';
import 'package:provider/provider.dart';


import 'widgets/app_info.dart';
import 'widgets/config.dart';
import 'widgets/status.dart';
import '../providers/settings_data.dart';

/// Display an object info in a tabs
class NsAppInfoScreen extends StatelessWidget {
  const NsAppInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingData = context.watch<NsAppSettingsData> ();
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App Server Information'),
          bottom: const TabBar( 
            padding: EdgeInsets.all(5),
            isScrollable: false, 
            
            tabs: <Widget>[
              Tab(text: "Object",
                icon: Icon(Icons.info_sharp),
              ),              
              Tab(text: "Status",
                icon: Icon(Icons.signal_wifi_statusbar_4_bar),
              ),
              Tab( text: "Configuration",
                icon: Icon(Icons.settings_applications),
              ),              
              Tab( text: "Privacy",
                icon: Icon(Icons.privacy_tip_rounded),
              ),     
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NsAppInfoWidget(settingData),           
            const NsAppStatusWidget(),
            const NsAppConfigWidget(),
            const NsAppPrivacyWidget()
            
          ],
        ),
      ),
    );
  }
}
