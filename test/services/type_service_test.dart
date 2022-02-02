// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/services/type_service.dart';


void main() {
  test('get app built int types', () async {
    print("Testing api/type/list :");
    String rootUrl = "https://myOnlineObjects.com/api/";
    var service = NsTypeService(rootUrl: rootUrl );
    var result = await service.getBuildtInTypes();

    if (result.status != 0) {
      print ("*>>Last Error:");
      print (service.lastError);
      print ("*>>Last Responsone:");
      print (service.lastResponse);

    }
    expect(result.status, 0);
    print (result.data);
    
  });
  

}
