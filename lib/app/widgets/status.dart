import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/config_data.dart';
import '../../services/result.dart';
import '../../serializables/app_status.dart';
import '../../services/app_service.dart';


class NsAppStatusWidget extends StatefulWidget { 
  const NsAppStatusWidget({Key? key}) : super(key: key);

  @override
  State<NsAppStatusWidget> createState() => _NsAppStatusWidgetState();
}

class _NsAppStatusWidgetState extends State<NsAppStatusWidget> {
  Result<NsAppStatus> _statusResult = Result<NsAppStatus>(status:-1);
  late NsAppService service;
 

  @override void initState() {
    var model = context.read<NsAppConfigData>();
    service = NsAppService(rootUrl: model.getApiRootUrl() );
    service.getStatus().then((r){
      _statusResult = r;
      setState(() { 
      });
    });
    super.initState();
  }
  void _checkStatus() async {
   
    _statusResult = await service.getStatus();

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      
    });
  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    
    if (_statusResult.status == 0 && _statusResult.data != null) {
      var status = _statusResult.data as NsAppStatus;
      return SingleChildScrollView (child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                status.name as String,
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'Version ${status.version}',
                style: Theme.of(context).textTheme.headline4,
              ),
              const Divider(height : 10, color:  Color(0xFFEAA400)),
              Text(
                'Version Date ${status.versionDate}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                'Last Startup Time ${status.lastStartupTime}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                'Number of Requests Since Last Startup: ${status.numberOfRequestsSinceStartup}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Divider(height : 10, color:  Color(0xFFEAA400)),
              Text(
                'Server Time ${status.currentTime}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              FloatingActionButton(
                onPressed: _checkStatus,
                tooltip: 'Check Status',
                child: const Icon(Icons.refresh),
              ), // Thi,
            ],
          ),
        )
      ); 
    }
    else {
      var statusCode = _statusResult.status;
      return Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getErrorWidget(statusCode) ,
              FloatingActionButton(
                onPressed: _checkStatus,
                tooltip: 'Check Status',
                child: const Icon(Icons.refresh),
              )
            ],
          ),
      );
    }
  }

  Widget getErrorWidget(int statusCode) {
    if (statusCode == -1) {
       return const Text("Click on Refresh button to check status");
    } else {
      return Text('Last Check Error Code: $statusCode' );
    }
  }
}