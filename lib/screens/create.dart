import 'package:flutter/material.dart';


import 'package:ns_demo/app/type/type_class.dart';
import 'package:ns_demo/app/type/type_objects.dart';
import 'package:ns_demo/serializables/app_object.dart';

import 'package:ns_demo/serializables/app_type.dart';

import 'package:ns_demo/utils/color_utils.dart';
import 'package:provider/provider.dart';

import '../providers/settings_data.dart';
import '../providers/user.dart';
import '../utils/endDrawer.dart';
import '../utils/drawer.dart';
import '../app/client/client_info.dart';
import '../utils/app_bar.dart';
import 'home_tabs.dart';
/// Search screen 
/// 
class NsCreateScreen extends StatefulWidget {
  const NsCreateScreen({Key? key}) : super(key: key);

  @override
  State<NsCreateScreen> createState() => _NsCreateScreenState();
}

class _NsCreateScreenState extends State<NsCreateScreen> {
  NsAppSettingsData? settingData;
  NsAppObject? appObject; 
  NsUserModel? user;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final Map<int,Widget> _widgetsMap = <int,Widget>{};

  Widget? getWidget(BuildContext context, int index) {
    if (_widgetsMap.containsKey(index)) {
      return _widgetsMap[index];
    }
    else {
   //   var appObject = ModalRoute.of(context)!.settings.arguments as NsAppObject?;
 
      Widget widget;
      switch(index) {
  /*      case 0:
          widget = NsObjectInfoWidget(appObject);
          break;
      case 1:
          widget = NsTypeObjectsWidget(appType, settings: settingData, user: user);
          break;
 */     default:
         widget = Text(
            'Index $index: Info',
            style: optionStyle,
          );
         break;
      }
      
      _widgetsMap[index] = widget;
      return widget;
    }
  
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    appObject = ModalRoute.of(context)!.settings.arguments as NsAppObject?;
    if (appObject == null) {
      // goHome(context);
      return const NsHomeScreenWithBottomTabs();
    }
    settingData = context.read<NsAppSettingsData> ();
    user = context.read<NsUserModel>();
    // _widgetsMap.clear(); // clear after each refresh
    var client = settingData?.getSelectedClientDetails();
    var footerColor = NsColorUtils.getFooterColor(client );
    var footerBackgroundColor = NsColorUtils.getFooterBackgroundColor(client );
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
       appBar: buildObjectAppBar(context, _scaffoldKey, "Create",
        settingData?.getSelectedClientDetails(), appObject, ),
    //  drawer: buildAppDrawer(context),      
    //  endDrawer: buildAppEndDrawer(context),
      body:  getWidget(context, _selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.clean_hands_sharp),
            label: 'Query',
            backgroundColor: footerBackgroundColor,
          ),
      
          BottomNavigationBarItem(
            icon: const Icon(Icons.verified_user),
            label: 'Objects',
            backgroundColor: footerBackgroundColor,
          ),
        
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: footerColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
