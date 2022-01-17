// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/services/app_service.dart';


void main() {
  test('check app Status', () async {
    print("Testing /app/status:");
    String rootUrl = "https://myOnlineObjects.com/api/";
    var service = NsAppService(rootUrl: rootUrl );
    var result = await service.getStatus();

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
