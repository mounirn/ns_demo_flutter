// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsAppObjectProperty _$NsAppObjectPropertyFromJson(Map<String, dynamic> json) =>
    NsAppObjectProperty(
      json['id'] as int,
      json['appObjectId'] as int,
      json['propertyId'] as int,
      json['value'] as String,
    );

Map<String, dynamic> _$NsAppObjectPropertyToJson(
        NsAppObjectProperty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appObjectId': instance.appObjectId,
      'propertyId': instance.propertyId,
      'value': instance.value,
    };

NsAppObject _$NsAppObjectFromJson(Map<String, dynamic> json) => NsAppObject()
  ..id = json['id'] as int?
  ..clientId = json['clientId'] as int?
  ..code = json['code'] as String?
  ..name = json['name'] as String?
  ..description = json['description'] as String?
  ..imageUrl = json['imageUrl'] as String?
  ..classId = json['classId'] as int?
  ..typeId = json['typeId'] as int?
  ..managerId = json['managerId'] as int?
  ..isAssignedTo = json['isAssignedTo'] as int?
  ..status = json['status'] as int?
  ..isActive = json['isActive'] as bool?
  ..isPublic = json['isPublic'] as bool?
  ..isRequired = json['isRequired'] as bool?
  ..createdOn = json['createdOn'] == null
      ? null
      : DateTime.parse(json['createdOn'] as String)
  ..createdBy = json['createdBy'] as int?
  ..lastEditBy = json['lastEditBy'] as int?
  ..lastEditOn = json['lastEditOn'] == null
      ? null
      : DateTime.parse(json['lastEditOn'] as String)
  ..lastEditFrom = json['lastEditFrom'] as String?
  ..displayOrder = json['displayOrder'] as int?
  ..properties = (json['properties'] as List<dynamic>?)
      ?.map((e) => NsAppObjectProperty.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$NsAppObjectToJson(NsAppObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'classId': instance.classId,
      'typeId': instance.typeId,
      'managerId': instance.managerId,
      'isAssignedTo': instance.isAssignedTo,
      'status': instance.status,
      'isActive': instance.isActive,
      'isPublic': instance.isPublic,
      'isRequired': instance.isRequired,
      'createdOn': instance.createdOn?.toIso8601String(),
      'createdBy': instance.createdBy,
      'lastEditBy': instance.lastEditBy,
      'lastEditOn': instance.lastEditOn?.toIso8601String(),
      'lastEditFrom': instance.lastEditFrom,
      'displayOrder': instance.displayOrder,
      'properties': instance.properties?.map((e) => e.toJson()).toList(),
    };

NsAppObjectsQuery _$NsAppObjectsQueryFromJson(Map<String, dynamic> json) =>
    NsAppObjectsQuery()
      ..ownerId = json['ownerId'] as int?
      ..hasClassId = json['hasClassId'] as int?
      ..hasBuiltInTypeId = json['hasBuiltInTypeId'] as int?
      ..hasManagerId = json['hasManagerId'] as int?
      ..hasCode = json['hasCode'] as String?
      ..nameContains = json['nameContains'] as String?;

Map<String, dynamic> _$NsAppObjectsQueryToJson(NsAppObjectsQuery instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'hasClassId': instance.hasClassId,
      'hasBuiltInTypeId': instance.hasBuiltInTypeId,
      'hasManagerId': instance.hasManagerId,
      'hasCode': instance.hasCode,
      'nameContains': instance.nameContains,
    };
