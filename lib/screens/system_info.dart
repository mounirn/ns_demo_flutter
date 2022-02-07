import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../app/client/app_clients.dart';
import '../../app/widgets/app_info.dart';
import '../../app/widgets/built_in_types.dart';
import '../../app/widgets/config.dart';
import '../../app/widgets/status.dart';
import '../providers/settings_data.dart';

/// Display the system information including the following 
/// 
class NsSystemInfoScreen extends StatelessWidget {
  const NsSystemInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingData = context.watch<NsAppSettingsData> ();
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App Server Information'),
          bottom: const TabBar( 
            padding: EdgeInsets.all(5),
            isScrollable: false, 
            
            tabs: <Widget>[
              Tab(text: "Overview",
                icon: Icon(Icons.info_sharp),
              ),              
              Tab(text: "Status",
                icon: Icon(Icons.signal_wifi_statusbar_4_bar),
              ),
              Tab( text: "Configuration",
                icon: Icon(Icons.settings_applications),
              ),              
              Tab( text: "Built In Types",
                icon: Icon(Icons.format_shapes),
              ),     
              Tab( text: "Participating Clients",
                icon: Icon(Icons.groups_outlined)
              )    
            ]
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NsAppInfoWidget(settingData),           
            const NsAppStatusWidget(),
            const NsAppConfigWidget(),
            const NsAppBuiltInTypesWidget(),
            const NsAppClients()
          ],
        ),
      ),
    );
  }
}
