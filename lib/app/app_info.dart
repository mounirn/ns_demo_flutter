import 'package:flutter/material.dart';

import 'widgets/config.dart';
import 'widgets/status.dart';

/// Display an object info in a tabs
class NsAppInfoScreen extends StatelessWidget {
  const NsAppInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App Information'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab( text: "Configuration",
                icon: Icon(Icons.beach_access_sharp),
              ),              
              Tab(text: "Status",
                icon: Icon(Icons.cloud_outlined),
              ),

              Tab(text: "Object",
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            NsAppConfigWidget(),
            NsAppStatusWidget(),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
