// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nsProperty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsProperty _$NsPropertyFromJson(Map<String, dynamic> json) => NsProperty(
      classId: json['classId'] as int?,
      propertyId: json['propertyId'] as int?,
      value: json['value'] as String?,
    )..id = json['id'] as int?;

Map<String, dynamic> _$NsPropertyToJson(NsProperty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'classId': instance.classId,
      'propertyId': instance.propertyId,
      'value': instance.value,
    };
