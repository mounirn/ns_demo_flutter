import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'models/catalog.dart';
import 'providers/config_data.dart';
import 'providers/settings_data.dart';
import 'providers/user.dart';

import 'utils/routes.dart';
import 'utils/theme.dart';
import 'providers/counter.dart';

void main() {
 
  runApp(const MyAppWithProviders());
}

//final ThemeData _appTheme = buildAppTheme();

/// This is a Material App 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var model = context.watch<NsAppSettingsData>();
    return MaterialApp(
      routes: getAppRoutes(context),
      title: 'M@URI Solutions Flutter Demo',
      theme: buildAppThemeForClient(model.getSelectedClientDetails()),
      home: const MyAppStartup()
    );
  }
}

/// This is the app stratup that will initialize the providers
/// See https://yapb.dev/line-of-business-apps-async-initialization-of-services-during-startup
class MyAppStartup extends StatefulWidget {
  const MyAppStartup({Key? key}) : super(key: key);

  @override
  _AppStartupState createState() => _AppStartupState();
}

class _AppStartupState extends State<MyAppStartup> {
  bool loaded = false;
  @override
  initState()  {
    super.initState();
    var configModel = context.read<NsAppConfigData>();
    var settingsModel = context.read<NsAppSettingsData>();
    if (settingsModel.configData != null) { // if already loaded
      loaded = true;
      Navigator.pushNamed(context, '/home');
      return;
    }
    configModel.load(true).then( (ok) {
      if (ok == true){    
        settingsModel.configData = configModel;
        settingsModel.load().then( (ok) { 
          if (ok) {
            // update the them
            Navigator.pushNamed(context, '/home');
            loaded = true;
          } else {
            Navigator.pushNamed(context, '/error/setting');
          }
        });
      } else {
        Navigator.pushNamed(context, '/error/config');
      }
    });
 
  }

  @override
  Widget build(BuildContext context) {
    var model = context.watch<NsAppSettingsData>();
    if (model.isLoading) {
      return const Text("Loading...");
    } else {
      return Container();
    }
  }
}

/// This is the app with the defined providers
class MyAppWithProviders extends StatelessWidget {
  const MyAppWithProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NsAppConfigData(),
        ),
        ChangeNotifierProvider(
          create: (context) => NsAppSettingsData(),
        ),
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
        ChangeNotifierProvider(
          // Initialize the model in the builder. That way, Provider
          // can own Counter's lifecycle, making sure to call `dispose`
          // when not needed anymore.
          create: (context) => Counter(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserModel(),
        ),
      ],
      child: const MyApp()
    );
  }
}
