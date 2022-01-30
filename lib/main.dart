import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'models/catalog.dart';
import 'providers/config_data.dart';
import 'providers/settings_data.dart';
import 'providers/user.dart';

import 'utils/routes.dart';
import 'utils/consts.dart';
import 'utils/theme.dart';
import 'providers/counter.dart';
import 'screens/loading.dart';
import 'screens/error.dart';

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
      title: NsConsts.C_AppName,
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
  bool loadingConfig = true;
  bool loadedConfig = false;
  @override
  initState()  {
    super.initState();
    var settingsModel = context.read<NsAppSettingsData>();
    // load config file 
    DefaultAssetBundle.of(context).loadString(NsConsts.C_ConfigFile).then( (data) {
      var configModel = context.read<NsAppConfigData>();
      loadedConfig = configModel.setupWith(data);
      if (loadedConfig){    
        settingsModel.configData = configModel;
        settingsModel.load().then( (ok) { 
          if (ok) {
            // update the them
            Navigator.pushNamed(context, '/home');
          } else {
            Navigator.pushNamed(context, '/error', 
              arguments: { "error": "Unable to load settings"});
          }
        });
      } else {
        Navigator.pushNamed(context, '/error');
      }
    }); 

 
  }

  @override
  Widget build(BuildContext context) {
    if (loadingConfig == true) {
      return const NsAppLoadingScreen();
    } else {
      if (loadedConfig == false) {
        return const NsAppErrorScreen();
      }
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
