import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../serializables/app_class.dart';

// import 'package:ns_demo/app/type/type_class.dart';
// import 'package:ns_demo/app/type/type_objects.dart';

import '../utils/app_bar.dart';

//import 'package:ns_demo/serializables/app_type.dart';

import '../utils/color_utils.dart';

import '../providers/settings_data.dart';
import '../providers/user.dart';
import 'home_tabs.dart';

/// Class Information Screen including the following tabs:
/// - Properties Definitions
/// - Collraborations
/// - Responsibilties
/// - Documentation Objects
class NsClassInfoScreen extends StatefulWidget {
  const NsClassInfoScreen({Key? key}) : super(key: key);

  @override
  State<NsClassInfoScreen> createState() => _State();
}

class _State extends State<NsClassInfoScreen> {
  NsAppSettingsData? settingData; 
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
      var cls = ModalRoute.of(context)!.settings.arguments as NsAppClass?;
 
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
    var cls = ModalRoute.of(context)!.settings.arguments as NsAppClass?;
    if (cls == null) {
      // goHome(context);
      return const NsHomeScreenWithBottomTabs();
    }

    settingData = context.read<NsAppSettingsData> ();
    user = context.read<NsUserModel>();

    var client = settingData?.getSelectedClientDetails();
    var footerColor = NsColorUtils.getFooterColor(client );
    var footerBackgroundColor = NsColorUtils.getFooterBackgroundColor(client );
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
       appBar: buildObjectAppBar(context, _scaffoldKey, "Class",
        settingData?.getSelectedClientDetails(), cls, ),
    //  drawer: buildAppDrawer(context),      
    //  endDrawer: buildAppEndDrawer(context),
      body:  getWidget(context, _selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.clean_hands_sharp),
            label: 'Properties',
            backgroundColor: footerBackgroundColor,
          ),
      
          BottomNavigationBarItem(
            icon: const Icon(Icons.verified_user),
            label: 'Collaborations',
            backgroundColor: footerBackgroundColor,
          ),
          
          BottomNavigationBarItem(
            icon: const Icon(Icons.verified_user),
            label: 'Responsibilities',
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
