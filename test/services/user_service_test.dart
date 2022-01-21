// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/services/user_service.dart';

void main() {

 test('check login', () async {
   print("Testing Login:");

   String rootUrl = "https://myOnlineObjects.com/api/";
   var service = NsUserService(rootUrl: rootUrl);
   var session = await service.login("nsunittest","nsunittest");
   if (session != null ){
    print (session);
    print (session.toString());
 
    if (session.isActive == true){
      print("We are loggedin ");
    }
    expect(session.isActive, true);

    // logout now
    bool loogedOut = await service.logout(session.sessionId);
    if (loogedOut) {
      print ("service.logged out");
    }
    expect(loogedOut, true);

    print ("Session  ID: ");
    print(session.sessionId);

    // refresh the token
    var loggedOutSession = await service.checkSession(session.sessionId);
    print("Afterlogging out");
    assert (loggedOutSession!= null, true);
    print (loggedOutSession);

    expect(loggedOutSession?.isActive, false);
  } else {
    print ("Error: ");
    print (service.lastError);
    print ("Response Error Code and Phrase");
    print (service.lastResponse.toString());
    assert(false,true);
  }
 

  });

  

}
