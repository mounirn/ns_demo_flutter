import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../serializables/app_class.dart';
import 'base_service.dart';
import 'result.dart';
import 'api.dart';

/// Provides functions checking the app status
class NsClassService extends NsBaseService implements IClassService{

  /// Constructor with the root server api
  NsClassService({required String rootUrl}) : super(rootUrl: rootUrl);

   /// Fetches a given client list of classes depending on the 
   /// current user logged in
  @override
  Future<Result<List<NsAppClass>>> getClientClasses(int clientId) async  {

    String url = rootUrl +  "class/list/$clientId";

    try {
      final response = await http.get(Uri.parse(url), 
        headers: super.getHeaders()
      );

      super.lastResponse = response;
    
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON using a compute 
        var data = await compute(parse, response.body);
        
        return Result(status: 0,  data: data);
      } else {
        return Result(status: response.statusCode, error: response.reasonPhrase );
      }
    } catch (e) {
      super.lastError = e;
      return Result(status: 1, exception: e);
    }
    
  }
 
  // A function that converts a response body into a list
  List<NsAppClass> parse(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<NsAppClass>((json) => NsAppClass.fromJson(json)).toList();
  }
}