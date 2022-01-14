// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nsAppStatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsAppStatus _$NsAppStatusFromJson(Map<String, dynamic> json) => NsAppStatus(
      version: json['version'] as String?,
    )
      ..appId = json['appId'] as String
      ..clientId = json['clientId'] as int
      ..appDomainInfo = json['appDomainInfo'] as String
      ..name = json['name'] as String
      ..rootDir = json['rootDir'] as String
      ..startedOK = json['startedOK'] as bool
      ..lastStartupTime = json['lastStartupTime'] == null
          ? null
          : DateTime.parse(json['lastStartupTime'] as String)
      ..numberOfRequestsSinceStartup =
          json['numberOfRequestsSinceStartup'] as int
      ..lastUpdate = json['lastUpdate'] as String
      ..currentTime = DateTime.parse(json['currentTime'] as String)
      ..serverInfo = json['serverInfo'] as String
      ..apiControllersCurrentCount = json['apiControllersCurrentCount'] as int
      ..dataStoreCurrentCount = json['dataStoreCurrentCount'] as int
      ..dataStoresTotalUsedCount = json['dataStoresTotalUsedCount'] as int
      ..servicesCurrentCount = json['servicesCurrentCount'] as int
      ..servicesTotalUsedCount = json['servicesTotalUsedCount'] as int;

Map<String, dynamic> _$NsAppStatusToJson(NsAppStatus instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'clientId': instance.clientId,
      'appDomainInfo': instance.appDomainInfo,
      'name': instance.name,
      'rootDir': instance.rootDir,
      'startedOK': instance.startedOK,
      'lastStartupTime': instance.lastStartupTime?.toIso8601String(),
      'numberOfRequestsSinceStartup': instance.numberOfRequestsSinceStartup,
      'version': instance.version,
      'lastUpdate': instance.lastUpdate,
      'currentTime': instance.currentTime.toIso8601String(),
      'serverInfo': instance.serverInfo,
      'apiControllersCurrentCount': instance.apiControllersCurrentCount,
      'dataStoreCurrentCount': instance.dataStoreCurrentCount,
      'dataStoresTotalUsedCount': instance.dataStoresTotalUsedCount,
      'servicesCurrentCount': instance.servicesCurrentCount,
      'servicesTotalUsedCount': instance.servicesTotalUsedCount,
    };
