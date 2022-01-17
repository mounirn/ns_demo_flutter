// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ns_demo/providers/user.dart';
import 'package:provider/provider.dart';

// Provides helper function to build an app drawer 
Drawer buildAppDrawer(BuildContext context)  {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Consumer<UserModel>(
            builder: (context, model, child) =>
            Column(
              children: [
                Text(
                  model.isLoggedIn() ? 'Welcome ${model.session?.fullName}': 'Welcome Guest',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                model.isLoggedIn() && model.validImageUrl() ? 
                  Image.network(model.session?.imageUrl as String, height: 80, width:80) :
                  Container()
              ]
            )
          )
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
             Navigator.pushNamed(
              context,
                '/',
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Counter'),
          onTap: () {
            Navigator.pushNamed(
              context,
                '/sample/counter',
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Counter Provider'),
          onTap: () {
            Navigator.pushNamed(
              context,
                '/sample/counter/provider',
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Photos'),
          onTap: () {
            Navigator.pushNamed(
              context,
                '/sample/photos',
            );
          },
        ),ListTile(
          leading: Icon(Icons.shop),
          title: Text('Products'),
          onTap: () {
            Navigator.pushNamed(
              context,
                '/catalog',
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text('My Cart'),
          onTap: () {
            Navigator.pushNamed(
              context,
                '/cart',
            );
          },
        ),ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
          onTap: () {
            Navigator.pushNamed(
              context,
                '/account/profile',
            );
          },
        ),
        Consumer<UserModel>(
          builder: (context, model, child) => Container(
            child: model.isLoggedIn() ? ListTile(
              leading: Icon(Icons.lock),
              title: Text('Logout'),
              onTap: () {
                model.logout();
              }
            )
            : ListTile(
              leading: Icon(Icons.lock),
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                    '/account/login',
                );
              }
            )
          )
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.pushNamed(
              context,
                '/app/settings',
            );
          },
        ), ListTile(
          leading: Icon(Icons.settings),
          title: Text('Status'),
          onTap: () {
            Navigator.pushNamed(
              context,
                '/app/status',
            );
          },
        )
      ],
    ),
  );
}
