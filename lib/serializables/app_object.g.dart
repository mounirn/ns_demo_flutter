// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsAppObjectProperty _$NsAppObjectPropertyFromJson(Map<String, dynamic> json) =>
    NsAppObjectProperty(
      json['id'] as int?,
      json['appObjectId'] as int?,
      json['propertyId'] as int?,
      json['value'] as String?,
    );

Map<String, dynamic> _$NsAppObjectPropertyToJson(
        NsAppObjectProperty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appObjectId': instance.appObjectId,
      'propertyId': instance.propertyId,
      'value': instance.value,
    };

NsAppObjectPreference _$NsAppObjectPreferenceFromJson(
        Map<String, dynamic> json) =>
    NsAppObjectPreference(
      json['id'] as int?,
      json['appObjectId'] as int?,
      json['key'] as String?,
      json['value'] as String?,
      json['baseType'] as int?,
      json['htmlType'] as int?,
    );

Map<String, dynamic> _$NsAppObjectPreferenceToJson(
        NsAppObjectPreference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appObjectId': instance.appObjectId,
      'key': instance.key,
      'value': instance.value,
      'baseType': instance.baseType,
      'htmlType': instance.htmlType,
    };

NsAppObjectColors _$NsAppObjectColorsFromJson(Map<String, dynamic> json) =>
    NsAppObjectColors()
      ..color = json['color'] as String?
      ..bkColor = json['bkColor'] as String?
      ..headerColor = json['headerColor'] as String?
      ..headerBKColor = json['headerBKColor'] as String?
      ..footerColor = json['footerColor'] as String?
      ..footerBKColor = json['footerBKColor'] as String?
      ..borderColor = json['borderColor'] as String?
      ..titleColor = json['titleColor'] as String?;

Map<String, dynamic> _$NsAppObjectColorsToJson(NsAppObjectColors instance) =>
    <String, dynamic>{
      'color': instance.color,
      'bkColor': instance.bkColor,
      'headerColor': instance.headerColor,
      'headerBKColor': instance.headerBKColor,
      'footerColor': instance.footerColor,
      'footerBKColor': instance.footerBKColor,
      'borderColor': instance.borderColor,
      'titleColor': instance.titleColor,
    };

NsAppObjectAddress _$NsAppObjectAddressFromJson(Map<String, dynamic> json) =>
    NsAppObjectAddress()
      ..id = json['id'] as String?
      ..objectId = json['objectId'] as int?
      ..line1 = json['line1'] as String?
      ..line2 = json['line2'] as String?
      ..city = json['city'] as String?
      ..stateProvince = json['stateProvince'] as String?
      ..zipPostalCode = json['zipPostalCode'] as String?
      ..countryId = json['countryId'] as int?;

Map<String, dynamic> _$NsAppObjectAddressToJson(NsAppObjectAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'objectId': instance.objectId,
      'line1': instance.line1,
      'line2': instance.line2,
      'city': instance.city,
      'stateProvince': instance.stateProvince,
      'zipPostalCode': instance.zipPostalCode,
      'countryId': instance.countryId,
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
      : NsAppObjectAddress.fromJson(json['address'] as Map<String, dynamic>);

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
      'systemId': instance.systemId,
      'properties': instance.properties?.map((e) => e.toJson()).toList(),
      'preferences': instance.preferences?.map((e) => e.toJson()).toList(),
      'colors': instance.colors?.toJson(),
      'address': instance.address?.toJson(),
    };
