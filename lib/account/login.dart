import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../serializables/login_info.dart';
import '../providers/user.dart';

// https://codelabs.developers.google.com/codelabs/mdc-101-flutter#4

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginInfo formData = LoginInfo(); 

  // TODO: Add text editing controllers (101)
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
            // TODO: Wrap Username with AccentColorOverride (103)
            TextField(
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
              onChanged: (value) {
                formData.username = value;
              },
            ),
            const SizedBox(height: 12.0),
            TextField(
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) {
                formData.password = value;
              },
            ),

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
                    await userModel.login(formData.username!, formData.password!);
                    if (userModel.session != null && userModel.isLoggedIn()){
                      Navigator.pop(context);
                    }
                  },
                ),
                Consumer<UserModel>(
                  builder: (context, model, child) => Text(
                    model.invalidLoginInfo? "Invalid Login Info": "",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
