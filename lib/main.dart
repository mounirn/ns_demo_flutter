// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account/login.dart';
import 'models/cart.dart';
import 'models/catalog.dart';
import 'sample/cart.dart';
import 'sample/catalog.dart';
import 'sample/counter.dart';
import 'app/home.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyAppWithProviders());
}

final ThemeData _appTheme = buildAppTheme();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomeScreen(),
        '/sample/counter' : (context) => const CounterScreen(title:'Counter'),
        '/details': (context) => const DetailScreen(),
        '/account/login': (context) => const LoginScreen(),
        '/sample/catalog': (context) => const CatalogScreen(),
        '/sample/cart': (context) => const CartScreen(),
        '/app/settings' : (context) => const CounterScreen(title:'Settings'),
      },
      title: 'M@URI Solutions Flutter Demo',
      theme: _appTheme,
      
      ///home: const MyHomePage(title: 'Welcome'),
    );
  }
}


class MyAppWithProviders extends StatelessWidget {
  const MyAppWithProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
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
      ],
      child: MyApp()
    );
  }
}
