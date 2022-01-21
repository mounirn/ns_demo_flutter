import 'package:flutter/foundation.dart';
import '../serializables/app_client.dart';
import 'base_service.dart';
import 'result.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


abstract class IClientService{
  Future<Result<List<NsAppClient>>> getClients();

  Future<Result<NsAppClientDetails>> getDetails(int id);

  Future<Result<NsAppClientDetails>> getMyTeam();
}
/// Provides functions checking the app status
class NsClientService extends NsBaseService implements IClientService{

  /// Constructor with the root server api
  NsClientService({required String rootUrl}) : super(rootUrl: rootUrl);

   /// Get App Participating Clients  
  @override
  Future<Result<List<NsAppClient>>> getClients() async  {

    String url = rootUrl +  "client/list";

    try {
      final response = await http.get(Uri.parse(url), 
        headers: super.getHeaders()
      );

      super.lastResponse = response;
    
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON using a compute 
        var data = await compute(parseClients, response.body);
        
        return Result(status: 0,  data: data);
      } else {
        return Result(status: response.statusCode, error: response.reasonPhrase );
      }
    } catch (e) {
      super.lastError = e;
    }
    return Result(status: 1);
  }


  /* Client Info sample json
  {"classesCount":170,"emailAddress":"contact@nouriSolutions.com","mainUserId":3,
  "phoneNumber":"510-517-5106","subscriptionDate":"2008-01-01T01:01:01",
  "url":null,"subDomain":"","fax":"","systemId":"99d1727a-964c-4285-9ae2-87b8bcafd338",
  "id":1,"managerId":0,"classId":213,"typeId":10002,
  "imageUrl":"https://www.myonlineobjects.com:443/public/1/0/1/logo.png",
  "status":2,"isActive":true,"displayOrder":0,"isAssignedTo":11975,
  "isPublic":true,"isRequired":false,
  "createdOn":"2018-12-31T15:11:53.77",
  "createdBy":null,"lastEditBy":3,
  "lastEditFrom":"2603:3024:90f:df00:19f0:beb2:76f1:6461",
  "lastEditOn":"2021-02-16T17:35:15.207",
  "colors":{"color":"#000000","bkColor":"#f7f7f7",
    "headerColor":"#0080ef","headerBKColor":"#ccddcc",
    "footerColor":"#ccddcc",
    "footerBKColor":"#0080ef",
    "borderColor":"#0080ef",
    "titleColor":"#ccffdd"},
  "address":{"id":"00000000-0000-0000-0000-000000000000",
    "objectId":0,
    "type":10,
    "line1":
    "1 Rowe Court",
    "line2":null,
    "city":"Alameda",
    "stateProvince":"CA",
    "zipPostalCode":"94501",
    "countryId":10381},
    "rowVersion":"AAAAAAACKrE=",
    "properties":[],
    "preferences":[
        { "id":1,
          "appObjectId":1,
          "key":"Created Default Classes",
          "baseType":10101,
          "htmlType":0,
          "value":"False"}
        ,{"id":2167,"appObjectId":1,"key":"IndustryId","baseType":10103,"htmlType":0,"value":"10302"},{"id":2168,"appObjectId":1,"key":"DevOpsByNS","baseType":10101,"htmlType":0,"value":"True"},{"id":2169,"appObjectId":1,"key":"Keywords","baseType":10104,"htmlType":0,"value":"enterprise objects and business modeling, organization, web sites, applications, development, objects, classes, collaborations, relationships, interactions, communication, reservations, bookings, assets management, status and location tracking"}
  */ 
@override
  Future<Result<NsAppClientDetails>> getDetails(int id) async  {

    String url = '${rootUrl}client/info/$id';

    try {
      final response = await http.get(Uri.parse(url), 
        headers: super.getHeaders()
      );

      super.lastResponse = response;
    
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        var data = NsAppClientDetails.fromJson(json.decode(response.body));
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
  Future<Result<NsAppClientDetails>> getMyTeam() async  {

    String url = '${rootUrl}client/my';

    try {
      final response = await http.get(Uri.parse(url), 
        headers: super.getHeaders()
      );

      super.lastResponse = response;
    
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        var data = NsAppClientDetails.fromJson(json.decode(response.body));
        return Result(status: 0,  data: data);
      } else {
        return Result(status: response.statusCode, error: response.reasonPhrase );
      }
    } catch (e) {
      super.lastError = e;
    }
    return Result(status: 1);
  }

  // A function that converts a response body into a List<NsAppClient>.
  List<NsAppClient> parseClients(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<NsAppClient>((json) => NsAppClient.fromJson(json)).toList();
  }

}
