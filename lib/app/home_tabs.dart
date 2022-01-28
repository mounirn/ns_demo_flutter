import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_data.dart';

import '../utils/endDrawer.dart';
import '../utils/drawer.dart';
//import './client/search.dart';
import '../app/widgets/client_info.dart';
import '../app/widgets/user_info.dart';
import '../utils/app_bar.dart';
import 'widgets/setting.dart';
import 'widgets/welcome.dart';

class NsHomeScreenWithBottomTabs extends StatefulWidget {
  const NsHomeScreenWithBottomTabs({Key? key}) : super(key: key);

  @override
  State<NsHomeScreenWithBottomTabs> createState() => _NsHomeScreenWithBottomTabsState();
}

class _NsHomeScreenWithBottomTabsState extends State<NsHomeScreenWithBottomTabs> {
  NsAppSettingsData? settingData;
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
          widget = NsClientInfoWidget(settingData);
          break;
      case 2:
          widget = const NsUserInfoWidget();
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
/*  static const List<Widget> _widgetOptions = <Widget>[
    //  NsClientSearch(),
   Text(
      'Index 0: Welcome',
      style: optionStyle,
    ),
    Text(
      'Index 1: Client Info',
      style: optionStyle,
    ),
      Text(
      'Index 1: Client Info',
      style: optionStyle,
    ),
  //  NsClientInfoWidget(),
      Text(
      'Index 2: User Info',
      style: optionStyle,
    ),
  //  NsUserInfoWidget(),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
*/

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    settingData = context.watch<NsAppSettingsData> ();

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'User',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
