import 'package:flutter/material.dart';
import 'package:ns_demo/app/widgets/divider.dart';


import 'package:provider/provider.dart';
import '../serializables/login_info.dart';
import '../providers/user.dart';
import '../providers/settings_data.dart';
import '../utils/consts.dart';

// https://codelabs.developers.google.com/codelabs/mdc-101-flutter#4

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginInfo formData = LoginInfo(); 

  @override
  Widget build(BuildContext context) {
    var settings = context.read<NsAppSettingsData>();
    var userModel = context.read<UserModel>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: const <Widget>[
                Image(image: AssetImage(NsConsts.C_NsLogo) ),
                SizedBox(height: 16.0),
                Text(NsConsts.C_CompanyName),
              ],
            ),
            const SizedBox(height: 120.0),

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
                    if (formData.invalid() ){
                      userModel.setInvalid(true);
                      return;
                    }

                    await userModel.login(formData.username!, formData.password!);
                    if (userModel.session != null && userModel.isLoggedIn()){
                      Navigator.pop(context);
                    }
                  },
                ),
           
              ],
            ),
            NsDivider(settings),
            Consumer<UserModel>(
                builder: (context, model, child) => Text(
                  model.invalidLoginInfo? "Please enter valid username and password": "",
                  style: NsConsts.C_RedErrorStyle,
                ),
            )
          ],
        ),
      ),
    );
  }
}
