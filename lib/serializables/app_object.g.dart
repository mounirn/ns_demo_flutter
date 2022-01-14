// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsAppObject _$NsAppObjectFromJson(Map<String, dynamic> json) => NsAppObject(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      classId: json['classId'] as int?,
      typeId: json['typeId'] as int?,
    )..imageUrl = json['imageUrl'] as String?;

Map<String, dynamic> _$NsAppObjectToJson(NsAppObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'classId': instance.classId,
      'typeId': instance.typeId,
    };
