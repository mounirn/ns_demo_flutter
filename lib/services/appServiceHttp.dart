import 'dart:convert';
import 'package:http/http.dart' as http;

import 'appService.dart';
import '../serializables/nsAppStatus.dart';
import 'result.dart';

/// Provides functions checking the app status
class NsAppService implements IAppService{
  final String rootUrl;
  dynamic _lastError;
  dynamic lastResponse; 
  

  /// Constructor with the root server api
  NsAppService({required this.rootUrl});
/*  NsAppService.fromAppSettings({NsAppSettings settings}) : 
    rootUrl = settings.objectsApiUrl, 
    sessionId=settings.sessionId;
*/
   /// Login using the given user is and password  
  @override
  Future<Result<NsAppStatus>> getStatus() async  {

    String url = rootUrl +  "app/status";

    try {
      final response = await http.get(Uri.parse(url), 
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          '_nssid' : getSessionId()
        }  
      );

      lastResponse = response;
    
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        var data = NsAppStatus.fromJson(json.decode(response.body));
        return Result(data: data, status: 0);
      } else {
        return Result(status: response.statusCode, error: response.reasonPhrase );
      }
    } catch (e) {
      _lastError = e;
    }
    return Result();
  }

  @override
  String get lastError { 
    return _lastError ? _lastError.toString() : '';
  }

  String getSessionId() {
    return '';
  }
}

