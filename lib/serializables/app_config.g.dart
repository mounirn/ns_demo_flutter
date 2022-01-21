// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsAppConfig _$NsAppConfigFromJson(Map<String, dynamic> json) => NsAppConfig()
  ..apiUrl = json['apiUrl'] as String?
  ..apiUrlDev = json['apiUrlDev'] as String?
  ..apiUrlDebug = json['apiUrlDebug'] as String?
  ..apiUrlTest = json['apiUrlTest'] as String?
  ..apiAuthToken = json['apiAuthToken'] as String?
  ..appId = json['appId'] as int?
  ..appClientId = json['appClientId'] as int?
  ..appObjectId = json['appObjectId'] as int?
  ..code = json['code'] as String?
  ..appName = json['appName'] as String?
  ..description = json['description'] as String?
  ..imageUrl = json['imageUrl'] as String?;

Map<String, dynamic> _$NsAppConfigToJson(NsAppConfig instance) =>
    <String, dynamic>{
      'apiUrl': instance.apiUrl,
      'apiUrlDev': instance.apiUrlDev,
      'apiUrlDebug': instance.apiUrlDebug,
      'apiUrlTest': instance.apiUrlTest,
      'apiAuthToken': instance.apiAuthToken,
      'appId': instance.appId,
      'appClientId': instance.appClientId,
      'appObjectId': instance.appObjectId,
      'code': instance.code,
      'appName': instance.appName,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
