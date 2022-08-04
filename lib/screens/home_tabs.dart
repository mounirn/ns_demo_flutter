import 'package:flutter/material.dart';

import 'package:ns_demo/utils/color_utils.dart';
import 'package:provider/provider.dart';

import '../providers/settings_data.dart';
import '../providers/user.dart';
import '../utils/endDrawer.dart';
import '../utils/drawer.dart';
import '../utils/app_bar.dart';
import '../app/client/client_info.dart';
// import '../app/widgets/user_info.dart';
/*
import '../../app/client/classes.dart';
import '../../app/object/preferences.dart';
import '../../app/widgets/setting.dart';
import '../../app/widgets/welcome.dart';
*/
class NsHomeScreenWithBottomTabs extends StatefulWidget {
  const NsHomeScreenWithBottomTabs({Key? key}) : super(key: key);

  @override
  State<NsHomeScreenWithBottomTabs> createState() => _NsHomeScreenWithBottomTabsState();
}

class _NsHomeScreenWithBottomTabsState extends State<NsHomeScreenWithBottomTabs> {
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
    
      Widget widget;
      switch(index) {
        case 0:
          widget = NsAppWelcome(settingData);
          break;
      case 1:
          widget = const NsClientInfoWidget();
          break;
      case 2:
          // widget = const NsUserInfoWidget();
          widget = const NsClientClassesWidget();
          break;
      case 3: 
        widget = NsAppSettingWidget(settingData);
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
    user = context.watch<NsUserModel>();
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
            icon: const Icon(Icons.model_training_sharp),
            label: 'Classes',
            backgroundColor: footerBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: footerBackgroundColor,
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: footerColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
