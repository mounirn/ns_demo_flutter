import 'package:flutter/material.dart';

import 'package:ns_demo/utils/color_utils.dart';
import 'package:provider/provider.dart';

import '../providers/settings_data.dart';
import '../providers/user.dart';
import '../utils/endDrawer.dart';
import '../utils/drawer.dart';
import '../app/widgets/client_info.dart';
import '../app/widgets/user_info.dart';
import '../utils/app_bar.dart';
import 'object/preferences.dart';
import 'widgets/setting.dart';
import 'widgets/welcome.dart';

class NsHomeScreenWithBottomTabs extends StatefulWidget {
  const NsHomeScreenWithBottomTabs({Key? key}) : super(key: key);

  @override
  State<NsHomeScreenWithBottomTabs> createState() => _NsHomeScreenWithBottomTabsState();
}

class _NsHomeScreenWithBottomTabsState extends State<NsHomeScreenWithBottomTabs> {
  NsAppSettingsData? settingData;
  
  UserModel? user;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final Map<int,Widget> _widgetsMap = <int,Widget>{};

  Widget? getWidget(BuildContext context, int index) {
    if (_widgetsMap.containsKey(index)) {
      return _widgetsMap[index];
    }
    else {
    
      Widget widget;
      switch(index) {
        case 0:
          widget = NsAppWelcome(settingData);
          break;
      case 1:
          widget = NsClientInfoWidget(settingData, user: user);
          break;
      case 2:
          widget = const NsUserInfoWidget();
          break;
      case 3: 
        widget = NsAppSettingWidget(settingData);
        break;
      case 4: 
        widget = NsPrefencesWidget(
            settingData?.getSelectedClientDetails(), settingData, user);
        break;
      default:
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
    settingData = context.watch<NsAppSettingsData> ();
    user = context.watch<UserModel>();
    _widgetsMap.clear(); // clear after each refresh
    var client = settingData?.getSelectedClientDetails();
    var footerColor = NsColorUtils.getFooterColor(client );
    var footerBackgroundColor = NsColorUtils.getFooterBackgroundColor(client );
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBarWithDrawers(context, _scaffoldKey, 
        settingData?.getSelectedClientDetails()),
      drawer: buildAppDrawer(context),      
      endDrawer: buildAppEndDrawer(context),
      body: Center(
        // child: _widgetOptions.elementAt(_selectedIndex),
        child: getWidget(context, _selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: footerBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business),
            label: 'Business',
            backgroundColor: footerBackgroundColor,
          ),
      
          BottomNavigationBarItem(
            icon: const Icon(Icons.verified_user),
            label: 'User',
            backgroundColor: footerBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: footerBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.room_preferences),
            label: 'Preferences',
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
