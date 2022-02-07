
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/settings_data.dart';
import '../../providers/config_data.dart';
import '../../services/result.dart';
import '../../services/app_service.dart';
import '../../serializables/app_info.dart';
import '../../app/object/hyperlink_learn_more.dart';
import '../../app/widgets/divider.dart';

import '../../widgets/hyperlink.dart';
import '../../utils/consts.dart';

import 'object_info.dart';
import 'text_error.dart';
import 'text_info.dart';

class NsAppInfoWidget extends StatefulWidget { 
  final NsAppSettingsData? settings; 
  const NsAppInfoWidget(this.settings, {Key? key}) : super(key: key);

  @override
  State<NsAppInfoWidget> createState() => _NsAppInfoWidgetState();
}

class _NsAppInfoWidgetState extends State<NsAppInfoWidget> {
  Result<NsAppInfo> _result = Result<NsAppInfo>(status:-1);
  late NsAppService service;


  @override void initState() {
    var model = context.read<NsAppConfigData>();
    service = NsAppService(rootUrl: model.getApiRootUrl() );
    service.getInfo().then((r){
      _result = r;
      setState(() { 
      });
    });
    super.initState();
  }

  void _refresh() async {
   
    _result = await service.getInfo();

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
    
    if (_result.status == 0 && _result.data != null) {
      var object = _result.data as NsAppInfo;
      return SingleChildScrollView (child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NsAppObjectInfoWidget(object, settings: widget.settings),
              FloatingActionButton(
                onPressed: _refresh,
                tooltip: 'Refresh Data',
                child: const Icon(Icons.refresh),
              ),
              NsDivider(widget.settings),
              NsHyperLinkLearnMore(object),
              NsDivider(widget.settings),
        
              const NsHyperLink(NsConsts.C_NsTermsUrl, "Terms & Conditions"),
              const NsHyperLink(NsConsts.C_NsPrivacyUrl, "Privacy"),
              const NsHyperLink(NsConsts.C_NsHelpUrl, "Help")
            //  NsRecordItem("Platform OS Version", Platform.operatingSystemVersion),
            //  NsRecordItem("Dart Version", Platform.version)
            ],
          ),
        )
      );  
    }
    else {
      var statusCode = _result.status;
      return Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getErrorWidget(statusCode) ,
              FloatingActionButton(
                onPressed: _refresh,
                tooltip: 'Refresh',
                child: const Icon(Icons.refresh),
              )
            ],
          ),
      );
    }
  }

  Widget getErrorWidget(int statusCode) {
    if (statusCode == -1) {
       return const NsTextInfo("Click on Refresh button to load...");
    } else {
      return NsTextError('Last Check Error Code: $statusCode' );
    }
  }
}