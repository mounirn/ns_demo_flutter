// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/serializables/app_config.dart';
import 'package:ns_demo/utils/helpers.dart' show loadAsset;


main(){
   test('loadAsset util and convert to config object', () async {
    // NOTE: Be sure to use double quotes ("),
    // not single quotes ('), inside the JSON string.
    // This string is JSON, not Dart.
    var asset = await loadAsset();
    var jsonObject = json.decode(asset);
    var config = NsAppConfig.fromJson(jsonObject);
    print (config);

  });



  /** Dot not edit -- keep for adding new tests 
  test('', () {

  });

  test('', () async {

  });*/

}