// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'account/login.dart';
import 'counter.dart';
import 'home.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
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
        '/counter' : (context) => const CounterScreen(title:'Counter'),
        '/details': (context) => const DetailScreen(),
        '/account/login': (context) => const LoginScreen(),
      },
      title: 'M@URI Solutions Flutter Demo',
      theme: _appTheme
      ///home: const MyHomePage(title: 'Welcome'),
    );
  }
}
