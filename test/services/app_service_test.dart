// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';

import 'package:ns_demo/services/app_service.dart';
// import 'package:ns_demo/services/user_service.dart';

void main() {
/*
 test('check login', () async {
   print("Testing Login:");

   String rootUrl = "https://myOnlineObjects.com/api/";
   var service = NsUserService(rootUrl: rootUrl );
   var session = await service.login("sysadmin","Welcome123!");
   print (session);
   print (session.toString());
   expect(session != null, true);
  // print (session.toJson());

   if (service.isLoggedIn){
     print("We are loggedin ");
   }
   expect(service.isLoggedIn, true);

   // logout now
   bool loogedOut = await service.logout();
   if (loogedOut) {
     print ("service.logged out");
   }
   expect(loogedOut, true);

   if (service.isLoggedIn && ! loogedOut){
     print("We are loggedin ");
   } else {
     print ("We are logged out - after logout");
   } 
  
   print(service.session);

   // refresh the token
   var token = await service.getToken();
   print("After getting token");
   if (token != null){
     print (token);
   }  else {
     print ("token is null");
   }
   expect(token != null, true);
   print(token);
  });
*/
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
