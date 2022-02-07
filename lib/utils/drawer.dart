// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ns_demo/app/object/logo.dart';
import 'package:ns_demo/providers/settings_data.dart';
import 'package:ns_demo/providers/user.dart';
import 'package:provider/provider.dart';

import 'routes.dart';

// Provides helper function to build an app drawer 
Drawer buildAppDrawer(BuildContext context)  {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Consumer<NsAppSettingsData>(
            builder: (context, model, child) =>
          DrawerHeader(
            decoration: BoxDecoration(
              color: model.getHeaderBackgroundColor(),
            ),
            child: NsLogo(model.selectedClient) 
          )
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
             Navigator.pushNamed(
              context,
                routeHome,
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
        ListTile(
          leading: Icon(Icons.get_app),
          title: Text('About'),
          onTap: () {
            Navigator.pushNamed(
              context,
                routeAppAbout,
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('System Info'),
          onTap: () {
            Navigator.pushNamed(
              context,
                cRouteSystemInfo,
            );
          },
        )
      ],
    ),
  );
}
