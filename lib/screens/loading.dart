
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import '../providers/config_data.dart';

/// Displays a loading screen
class NsAppLoadingScreen extends StatelessWidget {
  const NsAppLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading...'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                
              ),
            ),
            const Divider(height: 4, color: Colors.black),

          ],
        ),
      ),
    );
  }
}
