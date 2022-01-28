import 'package:flutter/material.dart';
import 'package:ns_demo/utils/color_utils.dart';
import '../serializables/app_client.dart';

AppBar buildAppBarWithDrawers(
  BuildContext context, 
  GlobalKey<ScaffoldState> scaffoldKey, 
  NsAppClientDetails? selectedClient) {
  return AppBar(
      title : Text('Welcome - ${selectedClient?.name}'), 
      centerTitle: true,
      backgroundColor: NsColorUtils.getHeaderBackgroundColor(selectedClient),
      foregroundColor: NsColorUtils.getHeaderColor(selectedClient),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          scaffoldKey.currentState!.openEndDrawer();
        }),
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          tooltip: 'Go to the next page',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Next page'),
                  ),
                  body: const Center(
                    child: Text(
                      'This is the next page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ));
          },
        ),
        IconButton(
          icon: const Icon(Icons.portrait_rounded),
          tooltip: 'Open User Menu', 
          onPressed: () {
            scaffoldKey.currentState!.openEndDrawer();
          },
        )
      ],
    );
  }