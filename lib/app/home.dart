import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/endDrawer.dart';
import '../utils/drawer.dart';
import '../providers/user.dart';
import './client/search.dart';
import '../providers/settings_data.dart';
import 'object/header.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userModel = context.watch<UserModel>();
    var settingsModel = context.watch<NsAppSettingsData>();

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: 
        AppBar(
          title : const Text('Welcome'), 
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            }),
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
            ),
            IconButton(
              icon: const Icon(Icons.portrait_rounded),
              tooltip: 'Open User Menu', 
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            )
          ],
        ),
      drawer: buildAppDrawer(context),
      endDrawer: buildAppEndDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            NsHeader(object: settingsModel.getSelectedClientDetails()),
            const NsClientSearch(),
            userModel.isLoggedIn() == false? 
              TextButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/account/login',
                  );
                },
              )
            :   
              TextButton(
                child: const Text('Logout'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/account/logout',
                  );
                },
              )
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