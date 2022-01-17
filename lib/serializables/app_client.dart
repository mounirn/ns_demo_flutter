import 'package:json_annotation/json_annotation.dart';

import 'app_object.dart';

part 'app_client.g.dart';


@JsonSerializable(explicitToJson: true)
// Defines data for data entry
class NsAppClient extends NsAppObject {
 
  String? phoneNumber;
  String? emailAddress;
  String? subDomain;
  String? url;
  String? fax;


  NsAppClient();

  factory NsAppClient.fromJson(Map<String, dynamic> json) =>
      _$NsAppClientFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppClientToJson(this);
  
}
/* Sample data 
{"classesCount":0,
"emailAddress":"contact@nouriSolutions.com",
"mainUserId":3,
"phoneNumber":"510-517-5106",
"subscriptionDate":"2008-01-01T01:01:01",
"url":null,
"subDomain":"",
"fax":"",
"systemId":"99d1727a-964c-4285-9ae2-87b8bcafd338",
"id":1,
"managerId":0,
"classId":213,
"typeId":10002,
"imageUrl":"https://myonlineobjects.com/public/1/0/1/logo.png",
"status":2,
"isActive":true,
"displayOrder":0,
"isAssignedTo":11975,
"isPublic":true,
"isRequired":false,
"createdOn":"2018-12-31T15:11:53.77",
"createdBy":null,
"lastEditBy":3,
"lastEditFrom":"2603:3024:90f:df00:19f0:beb2:76f1:6461",
"lastEditOn":"2021-02-16T17:35:15.207",
"colors":null,
"address":null,
"rowVersion":"AAAAAAACKrE=",
"properties":[],
"preferences":[],
"result":null,
"clientId":1,
"name":"N@URI Solutions",
"code":"NS",
"description":"
Nouri Solutions is a software engineering company specializing in the development, hosting and support of enterprise client/server and web based applications.

"}
*/
