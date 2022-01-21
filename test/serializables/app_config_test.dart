// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/serializables/app_config.dart';

main(){
 
  test('load json Config file', () async {
    // NOTE: Be sure to use double quotes ("),
    // not single quotes ('), inside the JSON string.
    // This string is JSON, not Dart.
    print(Directory.current);
    var configFile = File('assets/config.json');
    try {
      var contents = await configFile.readAsString();
      print(contents);
      var jsonObject = json.decode(contents);
      var config = NsAppConfig.fromJson(jsonObject);  
      print (config);
    } catch (e) {
      print(e);
    }
  });
  
  test('save json Config file', () async {
    var appConfig = NsAppConfig();
    appConfig.appClientId = 123;
    appConfig.code = "MA";
    appConfig.appName = "My App";
    appConfig.description = " <p>An <b>app</b> decription in html. </p>";
    appConfig.apiUrl = "https://api.kharbga.com";

    var jsonData = appConfig.toJson();
    var jsonText = json.encode(jsonData);

    print (jsonText);
  });

}