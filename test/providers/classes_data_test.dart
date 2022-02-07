// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';


import 'package:ns_demo/providers/classes_data.dart';
import 'package:ns_demo/providers/config_data.dart';

void main() {
  test('load classes of main team', () async {
    var configModel = NsAppConfigData();
    var result = await configModel.load(false);
    if (result!= true) {
      print(configModel.error);

    }
    assert(result == true);
    var model = NsClassesData(configModel);

    var result2 = await model.getLookup(1);
    if (result2 == null) {
      print(">>>Error: ");
      print (model.lastResult);
    }
    
    assert (result2 != null);
    assert (result2?.classes.isNotEmpty == true );
    print ("**>>Classes:");
    print (result2?.classes);
  });
  


}