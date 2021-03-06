
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utils/consts.dart';
import '../serializables/app_query_result.dart';
import '../serializables/app_query.dart';
import 'base_service.dart';
import 'result.dart';
import 'api.dart';

/// Provides functions signing in and signing out
class NsObjectService extends NsBaseService implements IObjectService{
  /// Constructor with the root server api
  NsObjectService({required String rootUrl}) : super(rootUrl: rootUrl);


@override
  Future<Result<NsAppObjectQueryResult>> getByCode(String code) async {

    String url = rootUrl +  "object/code/$code";
    try {
        var response  = await http.get(Uri.parse(url), 
        headers: super.getHeaders()
      ,);
      lastResponse = response;
      lastError = null;

      if (response.statusCode == 200) {
         var data = await compute(parse, response.body);
        
        return Result(status: 0, data: data);
      } else {

        return Result(status: response.statusCode, error: response.reasonPhrase );
      }
    } catch(e) {
      lastError =e;
      return Result(status: 1, exception: e);
    }
  }

  /// use to load lookup tables such as countries, languages, etc.
  @override
  Future<Result<NsAppObjectQueryResult>> getByType(int typeId, int clientId) async {

    var query = NsAppObjectsQuery();
    query.ownerId = clientId;
    query.hasBuiltInTypeId = typeId;
    query.pageSize = 500; // retrieve all defined objects for type
    return run(query);
  }

  /// use to load datasets that are known to be small in size and limited to the root team
  /// 
  @override
  Future<Result<NsAppObjectQueryResult>> getByClass(int classId, int clientId) async {

    var query = NsAppObjectsQuery();
    query.ownerId = clientId;
    query.hasClassId = classId;
    query.hasManagerId = clientId; // limit to be owned by the high level team
    query.pageSize = NsConsts.maxIntValue; // retrieve all defined objects for the class
    return run(query);
  }

  /// Runs the given query and resturs a result 
  @override
  Future<Result<NsAppObjectQueryResult>> run(NsAppObjectsQuery query) async {

    String url = "${rootUrl}object/query";
    try {
        var response  = await http.post(Uri.parse(url), 
        headers: super.getHeaders(),
        body: jsonEncode(query)
      ,);
      lastResponse = response;
      lastError = null;

      if (response.statusCode == 200) {
         var data = await compute(parse, response.body);
        
        return Result(status: 0, data: data);
      } else {

        return Result(status: response.statusCode, error: response.reasonPhrase, 
          exception: response.body );
      }
    } catch(e) {
      lastError =e;
      return Result(status: 1, exception: e);
    }
  }
  
  // A function that converts a response body into a List<NsAppClient>.
  NsAppObjectQueryResult parse(String responseBody) {
    final decoded = jsonDecode(responseBody);
    // return parsed.map<NsAppObject>((json) => NsAppObject.fromJson(json)).toList();
    return NsAppObjectQueryResult.fromJson(decoded);
  }
}


/* 
https://myonlineobjects.com/api/object/code/ns
-->
"query":{
  "hasManagerId":null,
  "loadObjectsClassInfo":false,
  "loadObjectsProperties":false,
  "loadObjectsAttributes":false,
  "loadObjectsPreferences":false,
  "hasSystemId":null,
  "hasId":null,
  "ownerId":null,
  "hasClassId":null,
  "hasBuiltInTypeId":null,
  "nameStartsWith":"",
  "nameContains":"",
  "hasCode":"ns",
  "codeOrNameContains":null,
  "isActive":true,
  "isAssignedToUserId":null,
  "hasStatus":2,
  "approvedOrAssignedStatus":null,
  "isPublic":true,
  "typeIds":null,
  "pageSize":50,
  "skip":0,
  "sortColumn":null,
  "sortColumnDir":null,
  "freeTextSearch":null,
  "recordsTotal":1
  },
"totalRecords":1,
"list":[
  ],
"success":true,
"errorMessage":"",
"status":1,
"startTime":"2022-02-02T12:21:02.2394526-06:00",
"endTime":"2022-02-02T12:21:02.2707098-06:00",
"records":1,
"notifyResult":null
}
*/
