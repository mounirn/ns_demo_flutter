// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/models/type_helper.dart';

import 'package:ns_demo/providers/built_in_types.dart';
import 'package:ns_demo/providers/config_data.dart';

void main() {
  test('load built in types', () async {
    var configModel = NsAppConfigData();
    var result = await configModel.load(false);
    if (result!= true) {
      print(configModel.error);

    }
    assert(result == true);
    var model = NsAppBuiltInTypes(configModel);

    var result2 = await model.load();
    if (result2 != true) {
      print (model.lastResult);
    }
    assert(result2 == true);
    assert (model.types!= null);
  });
  test('load countries', () async {
    var configModel = NsAppConfigData();
    var result = await configModel.load(false);
    if (result!= true) {
      print(">>>Error loading config");
      print(configModel.error);
    }
    assert(result == true);
    var model = NsAppBuiltInTypes(configModel);

    var result2 = await model.getObjects(kTypePlaceCountry);
    assert(result2 != null);

    if (result2?.notSuccess == true) {
      print(">>>Error ");
      print (model.lastResult);
    }
    assert (result2?.notSuccess == false);
    print ("Client Result:");
    print(result2);
    
    assert(result2?.data != null);
    print(result2?.data);
    print ("Server Result:");
    print(result2?.data);
    assert(result2?.data?.list != null);
    print(">>>Countries: ${result2?.data?.list?.length}" );
    print(result2?.data?.list);
  });



}