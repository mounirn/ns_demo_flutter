// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_object_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsAppObjectProperty _$NsAppObjectPropertyFromJson(Map<String, dynamic> json) =>
    NsAppObjectProperty(
      classId: json['classId'] as int?,
      propertyId: json['propertyId'] as int?,
      value: json['value'] as String?,
    )..id = json['id'] as int?;

Map<String, dynamic> _$NsAppObjectPropertyToJson(
        NsAppObjectProperty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'classId': instance.classId,
      'propertyId': instance.propertyId,
      'value': instance.value,
    };
