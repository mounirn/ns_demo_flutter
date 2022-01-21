import '../utils/app_data.dart';

class NsBaseService {
  final String rootUrl;

  dynamic lastError;
  dynamic lastResponse; 
  

  /// Constructor with the root server api
  NsBaseService({required this.rootUrl});

  Map<String,String> getHeaders() {
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      '_nssid' : getSessionId()
    };
    return headers;
  }
 

  String getSessionId() {
    return AppData.getInstance().sessionId;
  }
}