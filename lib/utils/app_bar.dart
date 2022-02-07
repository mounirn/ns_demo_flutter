import 'package:flutter/material.dart';
import 'package:ns_demo/serializables/app_object.dart';
import 'package:ns_demo/utils/color_utils.dart';
import '../serializables/app_client.dart';

/// Builds the App bar for a selected client including:
/// - A drawer menu on the left for client related actions
/// - A drawer menu on the right for user related actions
/// - A set of top level actions:
///   - Search 
///   - Error status (Display snackbar of error conditions)
/// - Use client colors 
/// Used for the home page
AppBar buildAppBarWithDrawers(
  BuildContext context, 
  GlobalKey<ScaffoldState> scaffoldKey, 
  NsAppClientDetails? selectedClient) {
  return AppBar(
      title : selectedClient?.name == null ? const Text("Welcome") :
        Text('Welcome - ${selectedClient?.name}'), 
      centerTitle: true,
      backgroundColor: NsColorUtils.getHeaderBackgroundColor(selectedClient),
      foregroundColor: NsColorUtils.getHeaderColor(selectedClient),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.pushNamed(context, '/search', arguments: selectedClient);
           // scaffoldKey.currentState!.openEndDrawer();
          }
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Notifications',
          onPressed: () {
            displayErrorSnackBar(context);
          },
        ),
        IconButton(
          icon: const Icon(Icons.add_box_rounded),
          tooltip: 'Create',
          onPressed: () {
            Navigator.pushNamed(context, '/create', arguments: selectedClient);
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

  /// Builds a specific object App bar including
  /// 
  /// 
  AppBar buildObjectAppBar(
    BuildContext context, 
    GlobalKey<ScaffoldState> scaffoldKey, String header,
    NsAppClientDetails? selectedClient, NsAppObject? obj, ) {
    return AppBar(
      title : Text('$header: ${obj?.name}'), 
      centerTitle: true,
      backgroundColor: NsColorUtils.getHeaderBackgroundColor(selectedClient),
      foregroundColor: NsColorUtils.getHeaderColor(selectedClient),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Search',
        onPressed: () {
          Navigator.pushNamed(context, '/search', arguments: obj);
        }),
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
           
          },
        ),
        /// TODO: include depending on user role
        IconButton(
          icon: const Icon(Icons.edit),
          tooltip: 'Edit',
          onPressed: () {
            Navigator.pushNamed(context, '/edit', arguments: obj); 
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

  displayErrorSnackBar(BuildContext context, ){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: 
        Text('TODO get error widgets'))
    );
  }