// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/services/class_service.dart';


void main() {
  test('get a client defined list of classes', () async {
    print("Testing api/class/list/{clientId} :");
    String rootUrl = "https://myOnlineObjects.com/api/";
    var service = NsClassService(rootUrl: rootUrl );
    var result = await service.getClientClasses(1);

    if (result.status != 0) {
      print ("*>>Last Error:");
      print (service.lastError);
      print ("*>>Last Responsone:");
      print (service.lastResponse);

    }
    expect(result.status, 0);
    print (result.data);

    print("Classes with Props and Collabs: ");
    result.data?.forEach((element) { 
      if (element.propertyDefinitions?.isNotEmpty == true 
          && element.collaborations?.isNotEmpty == true) {
        print(element);
      }
    });  
  });
  

}
