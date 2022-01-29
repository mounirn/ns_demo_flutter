
import 'package:flutter/material.dart';


/// Displays an error screen 
/// Checks the configuration and the settings data and reports any errors
class NsAppErrorScreen extends StatelessWidget {
  const NsAppErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
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
