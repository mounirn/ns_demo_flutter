
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../serializables/user_session.dart';
import 'base_service.dart';
import 'result.dart';

/// Provides functions signing in and signing out
class NsUserService extends NsBaseService{
  /// Constructor with the root server api
  NsUserService({required String rootUrl}) : super(rootUrl: rootUrl);


  /// Login using the given user is and password 
  /// Returns a User session if successful. Null otherwise
  /// If Null check, lastError and lastRespponse of the service 
  Future<NsUserSession?> login(String loginId, String password) async {

    String url = rootUrl +  "user/login";
    try {
        var response  = await http.post(Uri.parse(url), 
        headers: super.getHeaders(),
        body: jsonEncode(<String, String>{
          'loginId': loginId,
          'pwd': password
        })
      ,);
      lastResponse = response;
      lastError = null;

      if (response.statusCode == 200) {
        var session = NsUserSession.fromJson(json.decode(lastResponse.body));
        return session;
      } else {

        return null;
      }
    } catch(e) {
      lastError =e;
    }
    return null;
  }

  Future<Result<NsUserSession>> login2(String loginId, String password) async {
    String url = rootUrl +  "user/login";
    try {
        var response  = await http.post(Uri.parse(url), 
        headers: getHeaders(),
        body: jsonEncode(<String, String>{
          'loginId': loginId,
          'pwd': password
        })
      ,);
      lastResponse = response;
      lastError = null;
      
      if (response.statusCode == 200) {
        var session = NsUserSession.fromJson(json.decode(lastResponse.body));
     
        return Result(status: 0, data: session); 
      } else {
        // cases 404 or other errors
        return Result(status: response.statusCode, error: response.reasonPhrase);
      }
    } catch(e) {
      
      lastError =e;
      return Result(status: 1, error: e.toString());
    }
  }

  /// Logout a user logged in session
  Future<bool> logout(String sessionId) async {

    String url = rootUrl +  "user/logout";
    try {
      lastResponse = await http.post(Uri.parse(url), 
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          '_nssid' : sessionId
        }
      ,);
      
      if (lastResponse.statusCode == 200) {
        return true;
      }
      return false;
    }
    catch(e) {
      lastError = e;
    }
    return false;
  }

  /// retreive the current session token
  /// check the last response and error if the return is null
  Future<NsUserSession?> checkSession(String sessionId) async {

    String url = rootUrl +  "user/token";
    try {
      lastResponse = await http.get(Uri.parse(url), 
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          '_nssid' : sessionId
        }
      ,);
    
      lastError = null;
      if (lastResponse.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        var session = NsUserSession.fromJson(json.decode(lastResponse.body));
        return session;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        // throw Exception('Failed to load album');
        // log something
        return null;
      }
    } catch(e) {
      lastError =e;
    }
    return null;
  }  
}

