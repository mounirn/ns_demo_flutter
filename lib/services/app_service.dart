import '../serializables/app_status.dart';
import 'result.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


/// Defines an abstrac app service checker
abstract class IAppService{
  Future<Result<NsAppStatus>> getStatus();

  dynamic get lastError;
  dynamic get lastResponse;
}
/// Provides functions checking the app status
class NsAppService implements IAppService{
  final String rootUrl;

  dynamic _lastError;
  dynamic _lastResponse; 
  

  /// Constructor with the root server api
  NsAppService({required this.rootUrl});
/*  NsAppService.fromAppSettings({NsAppSettings settings}) : 
    rootUrl = settings.objectsApiUrl, 
    sessionId=settings.sessionId;
*/
   /// Get App Status  
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

      _lastResponse = response;
    
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        var data = NsAppStatus.fromJson(json.decode(response.body));
        return Result(status: 0,  data: data);
      } else {
        return Result(status: response.statusCode, error: response.reasonPhrase );
      }
    } catch (e) {
      _lastError = e;
    }
    return Result(status: 1);
  }

  @override
  dynamic get lastError { 
    return _lastError;
  }

  @override
  dynamic get lastResponse { 
    return _lastResponse;
  }

  String getSessionId() {
    return 'test';
  }
}

