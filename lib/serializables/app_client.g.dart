// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsAppClient _$NsAppClientFromJson(Map<String, dynamic> json) => NsAppClient()
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
  ..systemId = json['systemId'] as String?
  ..properties = (json['properties'] as List<dynamic>?)
      ?.map((e) => NsAppObjectProperty.fromJson(e as Map<String, dynamic>))
      .toList()
  ..preferences = (json['preferences'] as List<dynamic>?)
      ?.map((e) => NsAppObjectPreference.fromJson(e as Map<String, dynamic>))
      .toList()
  ..colors = json['colors'] == null
      ? null
      : NsAppObjectColors.fromJson(json['colors'] as Map<String, dynamic>)
  ..address = json['address'] == null
      ? null
      : NsAppObjectAddress.fromJson(json['address'] as Map<String, dynamic>)
  ..phoneNumber = json['phoneNumber'] as String?
  ..emailAddress = json['emailAddress'] as String?
  ..subDomain = json['subDomain'] as String?
  ..url = json['url'] as String?
  ..fax = json['fax'] as String?;

Map<String, dynamic> _$NsAppClientToJson(NsAppClient instance) =>
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
      'systemId': instance.systemId,
      'properties': instance.properties?.map((e) => e.toJson()).toList(),
      'preferences': instance.preferences?.map((e) => e.toJson()).toList(),
      'colors': instance.colors?.toJson(),
      'address': instance.address?.toJson(),
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'subDomain': instance.subDomain,
      'url': instance.url,
      'fax': instance.fax,
    };

NsAppClientDetails _$NsAppClientDetailsFromJson(Map<String, dynamic> json) =>
    NsAppClientDetails()
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
      ..systemId = json['systemId'] as String?
      ..properties = (json['properties'] as List<dynamic>?)
          ?.map((e) => NsAppObjectProperty.fromJson(e as Map<String, dynamic>))
          .toList()
      ..preferences = (json['preferences'] as List<dynamic>?)
          ?.map(
              (e) => NsAppObjectPreference.fromJson(e as Map<String, dynamic>))
          .toList()
      ..colors = json['colors'] == null
          ? null
          : NsAppObjectColors.fromJson(json['colors'] as Map<String, dynamic>)
      ..address = json['address'] == null
          ? null
          : NsAppObjectAddress.fromJson(json['address'] as Map<String, dynamic>)
      ..phoneNumber = json['phoneNumber'] as String?
      ..emailAddress = json['emailAddress'] as String?
      ..subDomain = json['subDomain'] as String?
      ..url = json['url'] as String?
      ..fax = json['fax'] as String?
      ..classesCount = json['classesCount'] as int?;

Map<String, dynamic> _$NsAppClientDetailsToJson(NsAppClientDetails instance) =>
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
      'systemId': instance.systemId,
      'properties': instance.properties?.map((e) => e.toJson()).toList(),
      'preferences': instance.preferences?.map((e) => e.toJson()).toList(),
      'colors': instance.colors?.toJson(),
      'address': instance.address?.toJson(),
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'subDomain': instance.subDomain,
      'url': instance.url,
      'fax': instance.fax,
      'classesCount': instance.classesCount,
    };
