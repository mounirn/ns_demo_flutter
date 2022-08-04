import 'package:http/http.dart' as http;
import 'base_service.dart';
import 'result.dart';
import 'dart:convert';
import '../serializables/app_status.dart';
import '../serializables/app_info.dart';


/// Defines an abstract app service checker
abstract class IAppService{
  Future<Result<NsAppStatus>> getStatus();
  Future<Result<NsAppInfo>> getInfo();
}

/// Provides functions checking the app status
class NsAppService extends NsBaseService implements IAppService {

  /// Constructor with the root server api
  NsAppService({required String rootUrl}) : super(rootUrl: rootUrl);

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

      super.lastResponse = response;
    
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        var data = NsAppStatus.fromJson(json.decode(response.body));
        return Result(status: 0,  data: data);
      } else {
        return Result(status: response.statusCode, error: response.reasonPhrase );
      }
    } catch (e) {
      super.lastError = e;
    }
    return Result(status: 1);
  }

  @override
  Future<Result<NsAppInfo>> getInfo() async  {

    String url = rootUrl +  "app/info";

    try {
      final response = await http.get(Uri.parse(url), 
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          '_nssid' : getSessionId()
        }  
      );

      super.lastResponse = response;
    
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        var data = NsAppInfo.fromJson(json.decode(response.body));
        return Result(status: 0,  data: data);
      } else {
        return Result(status: response.statusCode, error: response.reasonPhrase );
      }
    } catch (e) {
      super.lastError = e;
    }
    return Result(status: 1);
  }
  

}

