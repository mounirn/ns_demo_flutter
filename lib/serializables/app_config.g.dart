// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsAppConfig _$NsAppConfigFromJson(Map<String, dynamic> json) => NsAppConfig(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    )
      ..serveRootUrl = json['serveRootUrl'] as String?
      ..clientId = json['clientId'] as int?
      ..imageUrl = json['imageUrl'] as String?;

Map<String, dynamic> _$NsAppConfigToJson(NsAppConfig instance) =>
    <String, dynamic>{
      'serveRootUrl': instance.serveRootUrl,
      'id': instance.id,
      'clientId': instance.clientId,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
