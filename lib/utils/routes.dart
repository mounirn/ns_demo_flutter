import 'package:flutter/widgets.dart';
import '../app/app_info.dart';
import '../account/login.dart';
import '../app/settings.dart';
import '../sample/cart.dart';
import '../sample/catalog.dart';
import '../sample/photo.dart';
import '../app/home.dart';
import '../sample/counter.dart';
import '../sample/counter_provider.dart';
import '../app/home_tabs.dart';
import '../account/logout.dart';
import '../screens/error.dart';

getAppRoutes(BuildContext context) { 
 var ret = {
        '/home': (context) => const NsHomeScreenWithBottomTabs(),
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
        '/error' : (context) => const NsAppErrorScreen(),
        '/app/info' : (context) => const NsAppInfoScreen(),
  };
  return ret;
}