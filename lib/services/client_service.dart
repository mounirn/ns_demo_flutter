import 'package:flutter/foundation.dart';

import '../serializables/app_client.dart';
import 'result.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


abstract class IClientService{
  Future<Result<List<NsAppClient>>> getClients();

  dynamic get lastError;
  dynamic get lastResponse;
}
/// Provides functions checking the app status
class NsClientService implements IClientService{
  final String rootUrl;

  dynamic _lastError;
  dynamic _lastResponse; 
  
  /// Constructor with the root server api
  NsClientService({required this.rootUrl});

   /// Get App Participating Clients  
  @override
  Future<Result<List<NsAppClient>>> getClients() async  {

    String url = rootUrl +  "client/list";

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
        // then parse the JSON using a compute 
        var data = await compute(parseClients, response.body);
        
        return Result(status: 0,  data: data);
      } else {
        return Result(status: response.statusCode, error: response.reasonPhrase );
      }
    } catch (e) {
      _lastError = e;
    }
    return Result(status: 1);
  }

  // A function that converts a response body into a List<NsAppClient>.
  List<NsAppClient> parseClients(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<NsAppClient>((json) => NsAppClient.fromJson(json)).toList();
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
