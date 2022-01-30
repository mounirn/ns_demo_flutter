import 'dart:convert';
import 'dart:io';

import 'package:ns_demo/serializables/app_config.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';


// Manages the settings data
class NsAppConfigData with ChangeNotifier {
  static const String defaultRootUrl = "https://myOnlineObjects.com";
  bool isLoading = true;
  NsAppConfig? config;
  Object? error;
  
  loadConfig() {
    rootBundle.loadString('config.json').then((configStr) {
      config = NsAppConfig.fromJson(json.decode(configStr));
    });
  }

  /// use this method to setup the configuration from data loaded through other means
  /// Android loading assets requires using a build context
  bool setupWith(String configData) {
    var ok = false;
    try {   
       config = NsAppConfig.fromJson(json.decode(configData));
       ok = config!= null;
    } catch(e ){
      error = e;
    }
    return ok;
  }

  Future<NsAppConfig?> loadConfigAsync({bool useAssetsBundle = false}) async {
    if (useAssetsBundle == true){
      var configStr = await rootBundle.loadString('config.json');
      config = NsAppConfig.fromJson(json.decode(configStr));
      return config;
    } else { // loads a file
      var configFile = File('assets/config.json');
      var contents = await configFile.readAsString(); 
      config = NsAppConfig.fromJson(json.decode(contents));
      return config;
    }
  }

  /// Load user preferences from shared preferences
  /// Also loads the app participating clients from network (API call)
  Future<bool> load(bool useAssetsBundle) async {
    var ok  = false;
    isLoading = true;
    await loadConfigAsync(useAssetsBundle: useAssetsBundle);
  
    isLoading = false;
    notifyListeners();
    ok = config != null;
    return ok;
  }
  

  Map<String, dynamic> getConfigData() {
    Map<String, dynamic> ret  = <String, dynamic>{};
    if (config == null){
      return ret;
    }

    ret["Objects API URI"] = config?.apiUrl;

    return ret;
  }

  /// Checks the coniguration to be loaded from assets and returns 
  /// the root server url if found. Otherwise, returns the default demo server url
  String getServerUrlFromConfig() {
    if (config != null){
      var str = config?.apiUrl;
      if (str != null && str.isNotEmpty){
        return str;
      }
    }
    
    return defaultRootUrl;
  }

  /// returns the App Server root api url
  String getApiRootUrl() {
    var serverRootUrl = getServerUrlFromConfig();
    return '$serverRootUrl/api/';
  }
}
