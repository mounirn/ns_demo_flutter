import 'package:json_annotation/json_annotation.dart';

part 'app_query.g.dart';


@JsonSerializable(explicitToJson: true)
class NsAppObjectsQuery {
  
  int? ownerId;
  int? hasClassId;
  int? hasBuiltInTypeId;
  String? typeIds;
  String? hasCode;
  String? nameContains;
  String? codeOrNameContains;
  String? nameStartsWith;  
  bool? isActive;
  bool? isPublic;
  int? hasStatus;
  bool? approvedOrAssignedStatus;

  int? isAssignedToUserId;
  int? hasManagerId;

  /// the records to skip 
  int skip = 0;

  /// the total number of records to return
  int pageSize = 20;

  /// The query result total records count (used for output)
  int recordsTotal = 0;

  NsAppObjectsQuery();

  factory NsAppObjectsQuery.fromJson(Map<String, dynamic> json) =>
      _$NsAppObjectsQueryFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppObjectsQueryToJson(this);

  @override toString() {
    var ret = "Skip: $skip Max: $pageSize - ";
    if (ownerId != null){
      ret = ret + "Owner Id = ${ownerId ??  'any'}";
    }
    if (hasClassId != null) {
      ret = ret + "; Has Class Id = ${ hasClassId ?? 'any'}";
    }
    if (hasBuiltInTypeId!= null){ 
     ret = ret + "Has BuiltIn Type Id: ${hasBuiltInTypeId ??  'any'} ";
    }
    if (hasManagerId != null) {
     ret = ret + "Has Manager Id: ${hasManagerId ??  'any'} ";
    }
    if (hasCode != null) {
     ret = ret + "Has Code: ${hasCode ??  'any'} ";
    }
    if (nameContains != null) {
     ret = ret + "Name Contains: ${nameContains ??  'any'} ";
    }
    return ret;
  }
}
/*
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

  */