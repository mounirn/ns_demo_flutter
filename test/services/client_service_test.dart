// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/services/client_service.dart';

void main() {

  test('load participating clients', () async {
    print("Testing /client/list");
    String rootUrl = "https://myOnlineObjects.com/api/";
    var service = NsClientService(rootUrl: rootUrl );
    var result = await service.getClients();

    if (result.status != 0) {
      print ("*>>Last Error:");
      print (service.lastError);
      print ("*>>Last Responsone:");
      print (service.lastResponse);

    }
    else {
      expect(result.status, 0);
      assert(result.data != null);
      for (var element in result.data!) {
          print(element.toString());
      }
    }
  });


  test('load client details', () async {
    print("Testing /client/info/{id}");
    String rootUrl = "https://myOnlineObjects.com/api/";
    var service = NsClientService(rootUrl: rootUrl );
    var result = await service.getDetails(1);

    if (result.status != 0) {
      print ("*>>Last Error:");
      print (service.lastError);
      print ("*>>Last Responsone:");
      print (service.lastResponse);

    }
    else {
      expect(result.status, 0);
      assert(result.data != null);
      print (result.data!);
    }
  });

}
