import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user.dart';
import '../../account/session_view.dart';

class NsUserInfoWidget extends StatelessWidget {
  const NsUserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userModel = context.watch<NsUserModel>();
     
    return Column(children: [ 
        NsSessionView(userModel.session),
        const Divider(height: 10, color: Colors.blue),
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
    ],
    );
  }
}
 