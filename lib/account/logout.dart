import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  bool? logoutSuccess; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: const <Widget>[
                Image(image: AssetImage('/image/logo.png') ),
                SizedBox(height: 16.0),
                Text('N@URI Solutions'),
              ],
            ),
            const SizedBox(height: 120.0),
             
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () async {
                     // 
                    var userModel = context.read<UserModel>();
                    logoutSuccess = await userModel.logout();

                  },
                ),
               
              ],
            ),

          ],
        ),
      ),
    );
  }
}
