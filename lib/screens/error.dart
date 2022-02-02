
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../serializables/app_object.dart';
import '../widgets/card_check.dart';
import '../app/widgets/text_error.dart';
import '../providers/settings_data.dart';
import '../widgets/result.dart';
/// Displays an error screen 
/// Uses the arguments passed to identify the error object
/// Checks the configuration and the settings data and reports any errors
class NsAppErrorScreen extends StatelessWidget {
  const NsAppErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsModel = context.read<NsAppSettingsData>();
    var loadedConfigOk = settingsModel.configData != null;
    var loadedClientsOk = settingsModel.participatingClients != null;

    final args = ModalRoute.of(context)!.settings.arguments as NsAppObject;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView( 
        child: Container(
          color: Colors.yellow,
          child: Center( child: 
            Column(
              children: [
                NsTextError(args.name ?? '') ,
                const Divider(height: 4, thickness: 2, color: Colors.black),
                NsCardCheck(loadedConfigOk, "Loaded Config"),
                const Divider(height: 4, thickness: 2, color: Colors.black),
                NsCardCheck(loadedClientsOk, "Loaded Clients - count: ${settingsModel.participatingClients?.length}"),
                const Divider(height: 4, thickness: 2, color: Colors.black),
                NsResultWidget(settingsModel.lastResult),

              ],
            )
          ),
        ),
      )
    )
    ;
  }
}
