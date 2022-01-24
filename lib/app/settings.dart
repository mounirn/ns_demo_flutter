import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/settings_data.dart';
import 'clients.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   //var model = context.watch<NsAppSettingsData>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.lightGreen,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const _SettingItem("App Server Url", "https://?" /*model.getApiRootUrl() */),
            const Divider(height: 4, color: Colors.black),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: ClientsList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            const _SettingItem("item label", "item value")
          ],
        ),
      ),
    );
  }
}


class _SettingItem extends StatefulWidget {
  final String label;
  final dynamic value;
  const _SettingItem(this.label, this.value, {Key? key}) : super(key: key);

  @override
  State<_SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<_SettingItem> {
  @override
  Widget build(BuildContext context) {
    var settingStyle =
        Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18);

    return Column(children: [
      SizedBox(
      height: 80,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Another way to listen to a model's change is to include
            // the Consumer widget. This widget will automatically listen
            // to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild
            // the rest of the widgets in this build method.
            //Consumer<NsAppSettingsData>(
            //    builder: (context, model, child) =>
            //        Text('${model.getSetting(label, value)}', style: settingStyle)),
            Text(widget.label, style: settingStyle),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Editing not supported yet.')));
              },
              style: TextButton.styleFrom(primary: Colors.black),
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    ),
    Text(widget.value.toString()),
    const Divider(height : 10, color:  Color(0xFFEAA400)),
    ]
    )
    ;
  }
}
