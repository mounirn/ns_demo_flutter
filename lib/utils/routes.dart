import 'package:flutter/widgets.dart';
import 'package:ns_demo/screens/create.dart';
// import 'package:ns_demo/screens/search.dart';
import 'package:ns_demo/screens/type_info.dart';

import '../account/login.dart';
import '../app/settings.dart';
import '../sample/cart.dart';
import '../sample/catalog.dart';
import '../sample/photo.dart';
import '../app/home.dart';
import '../sample/counter.dart';
import '../sample/counter_provider.dart';
import '../screens/home_tabs.dart';
import '../account/logout.dart';
import '../screens/error.dart';
import '../screens/about.dart';
import '../screens/class_info.dart';
import '../screens/system_info.dart';

// Defines the routes
const String routeHome = '/home';
const String routeError = '/error';
const String routeAppAbout = '/app/about';
const String cRouteSystemInfo = '/system/info';

getAppRoutes(BuildContext context) { 
 var ret = {
        routeHome: (context) => const NsHomeScreenWithBottomTabs(),
        '/home/no/tabs': (context) => const HomeScreen(),
        '/sample/counter' : (context) => const CounterScreen(title:'Counter'),
        '/sample/counter/provider' : (context) => const CounterWithProviderScreen(),
        '/sample/photos' : (context) => const PhotosScreen(title: 'Fetches and Parse data using an Isolate'),
        '/details': (context) => const DetailScreen(),
        '/account/login': (context) => const LoginScreen(),
        '/account/logout': (context) => const LogoutScreen(),
        '/catalog': (context) => const CatalogScreen(),
        '/cart': (context) => const CartScreen(),
        '/app/settings' : (context) => const SettingsScreen(),
        '/type' : (context) => const NsTypeInfoScreen(),
        '/class' : (context) => const NsClassInfoScreen(),
  //      '/object' : (context) => const NsObjectInfoScreen(),
  //      '/search' : (context) => const NsSearchScreen(),
   //     '/edit' : (context) => const NsEditScreen(),
        '/create' : (context) => const NsCreateScreen(),
        routeError : (context) => const NsAppErrorScreen(),
        routeAppAbout : (context) => const NsAppAboutScreen(),
        cRouteSystemInfo : (context) => const NsSystemInfoScreen(),
  };
  return ret;
}