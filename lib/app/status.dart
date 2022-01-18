import 'package:flutter/material.dart';
import 'package:ns_demo/services/result.dart';
import '../serializables/app_status.dart';
import '../services/app_service.dart';
import '../utils/drawer.dart';

class AppStatusScreen extends StatefulWidget {
  const AppStatusScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<AppStatusScreen> createState() => _AppStatusScreenState();
}

class _AppStatusScreenState extends State<AppStatusScreen> {
  Result<NsAppStatus> _statusResult = Result<NsAppStatus>(status:-1);
  var service = NsAppService(rootUrl: "https://myOnlineObjects.com/api/" );

  @override void initState() {
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
      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        drawer: buildAppDrawer(context),
        body: Center(
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
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _checkStatus,
          tooltip: 'Check Status',
          child: const Icon(Icons.refresh),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
    else {
      var statusCode = _statusResult.status;
      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        drawer: buildAppDrawer(context),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getErrorWidget(statusCode)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _checkStatus,
          tooltip: 'Check Status',
          child: const Icon(Icons.refresh),
        ), // This trailing comma makes auto-formatting nicer for build methods.
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