// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/providers/config_data.dart';


void main() {
  test('load app configuration data', () async {
    var model = NsAppConfigData();

    var result = await model.load(false);

    assert(result == true);
    
  });

}
