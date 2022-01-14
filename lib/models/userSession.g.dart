// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userSession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSession _$UserSessionFromJson(Map<String, dynamic> json) => UserSession(
      sessionId: json['sessionId'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
    )
      ..imageUrl = json['imageUrl'] as String?
      ..isActive = json['isActive'] as bool?
      ..isAdmin = json['isAdmin'] as bool?
      ..isSysAdmin = json['isSysAdmin'] as bool?
      ..lastAccess = json['lastAccess'] == null
          ? null
          : DateTime.parse(json['lastAccess'] as String);

Map<String, dynamic> _$UserSessionToJson(UserSession instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'email': instance.email,
      'fullName': instance.fullName,
      'imageUrl': instance.imageUrl,
      'isActive': instance.isActive,
      'isAdmin': instance.isAdmin,
      'isSysAdmin': instance.isSysAdmin,
      'lastAccess': instance.lastAccess?.toIso8601String(),
    };
