// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ns_demo/providers/user.dart';
import 'package:provider/provider.dart';

// Provides helper function to build an app drawer 
Drawer buildAppEndDrawer(BuildContext context)  {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Consumer<NsUserModel>(
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
        Consumer<NsUserModel>(
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
              ],
    ),
  );
}
