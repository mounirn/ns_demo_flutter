import 'package:flutter/material.dart';

import '../utils/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : const Text('Welcome')),
      drawer: buildAppDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [       
            TextButton(
              child: const Text('View Details'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                );
              },
            ),
            TextButton(
              child: const Text('View Counter'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/counter',
                );
              },
            ),
            TextButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/account/login',
                );
              },
            ),
          ] 
        ),
      ) 
    );

  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: const Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}