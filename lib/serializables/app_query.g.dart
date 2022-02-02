// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsAppObjectsQuery _$NsAppObjectsQueryFromJson(Map<String, dynamic> json) =>
    NsAppObjectsQuery()
      ..ownerId = json['ownerId'] as int?
      ..hasClassId = json['hasClassId'] as int?
      ..hasBuiltInTypeId = json['hasBuiltInTypeId'] as int?
      ..typeIds = json['typeIds'] as String?
      ..hasCode = json['hasCode'] as String?
      ..nameContains = json['nameContains'] as String?
      ..codeOrNameContains = json['codeOrNameContains'] as String?
      ..nameStartsWith = json['nameStartsWith'] as String?
      ..isActive = json['isActive'] as bool?
      ..isPublic = json['isPublic'] as bool?
      ..hasStatus = json['hasStatus'] as int?
      ..approvedOrAssignedStatus = json['approvedOrAssignedStatus'] as bool?
      ..isAssignedToUserId = json['isAssignedToUserId'] as int?
      ..hasManagerId = json['hasManagerId'] as int?
      ..skip = json['skip'] as int
      ..pageSize = json['pageSize'] as int
      ..recordsTotal = json['recordsTotal'] as int;

Map<String, dynamic> _$NsAppObjectsQueryToJson(NsAppObjectsQuery instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'hasClassId': instance.hasClassId,
      'hasBuiltInTypeId': instance.hasBuiltInTypeId,
      'typeIds': instance.typeIds,
      'hasCode': instance.hasCode,
      'nameContains': instance.nameContains,
      'codeOrNameContains': instance.codeOrNameContains,
      'nameStartsWith': instance.nameStartsWith,
      'isActive': instance.isActive,
      'isPublic': instance.isPublic,
      'hasStatus': instance.hasStatus,
      'approvedOrAssignedStatus': instance.approvedOrAssignedStatus,
      'isAssignedToUserId': instance.isAssignedToUserId,
      'hasManagerId': instance.hasManagerId,
      'skip': instance.skip,
      'pageSize': instance.pageSize,
      'recordsTotal': instance.recordsTotal,
    };
