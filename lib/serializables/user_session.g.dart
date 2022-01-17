// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsUserSession _$NsUserSessionFromJson(Map<String, dynamic> json) =>
    NsUserSession(
      json['sessionId'] as String,
      json['fullName'] as String,
      json['isActive'] as bool,
    )
      ..clienId = json['clienId'] as int?
      ..appId = json['appId'] as String?
      ..accountId = json['accountId'] as int?
      ..emailAddress = json['emailAddress'] as String?
      ..imageUrl = json['imageUrl'] as String?
      ..isAdmin = json['isAdmin'] as bool?
      ..isSysAdmin = json['isSysAdmin'] as bool?
      ..createdOn = json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String)
      ..lastAccess = json['lastAccess'] == null
          ? null
          : DateTime.parse(json['lastAccess'] as String)
      ..fromIpAddress = json['fromIpAddress'] as String?
      ..mainRole = json['mainRole'] as int?;

Map<String, dynamic> _$NsUserSessionToJson(NsUserSession instance) =>
    <String, dynamic>{
      'clienId': instance.clienId,
      'appId': instance.appId,
      'accountId': instance.accountId,
      'sessionId': instance.sessionId,
      'emailAddress': instance.emailAddress,
      'fullName': instance.fullName,
      'imageUrl': instance.imageUrl,
      'isActive': instance.isActive,
      'isAdmin': instance.isAdmin,
      'isSysAdmin': instance.isSysAdmin,
      'createdOn': instance.createdOn?.toIso8601String(),
      'lastAccess': instance.lastAccess?.toIso8601String(),
      'fromIpAddress': instance.fromIpAddress,
      'mainRole': instance.mainRole,
    };
