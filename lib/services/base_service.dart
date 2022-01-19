class NsBaseService {
  final String rootUrl;

  dynamic _lastError;
  dynamic _lastResponse; 
  

  /// Constructor with the root server api
  NsBaseService({required this.rootUrl});

  Map<String,String> getHeaders() {
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      '_nssid' : getSessionId()
    };
    return headers;
  }
  dynamic get lastError { 
    return _lastError;
  }

  dynamic get lastResponse { 
    return _lastResponse;
  }

  String getSessionId() {
    return 'test';
  }
}