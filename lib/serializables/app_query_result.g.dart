// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_query_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NsAppResult _$NsAppResultFromJson(Map<String, dynamic> json) => NsAppResult()
  ..success = json['success'] as bool?
  ..errorMessage = json['errorMessage'] as String?
  ..status = json['status'] as int?
  ..startTime = json['startTime'] == null
      ? null
      : DateTime.parse(json['startTime'] as String)
  ..endTime =
      json['endTime'] == null ? null : DateTime.parse(json['endTime'] as String)
  ..records = json['records'] as int?;

Map<String, dynamic> _$NsAppResultToJson(NsAppResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errorMessage': instance.errorMessage,
      'status': instance.status,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'records': instance.records,
    };

NsAppObjectQueryResult _$NsAppObjectQueryResultFromJson(
        Map<String, dynamic> json) =>
    NsAppObjectQueryResult()
      ..success = json['success'] as bool?
      ..errorMessage = json['errorMessage'] as String?
      ..status = json['status'] as int?
      ..startTime = json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String)
      ..endTime = json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String)
      ..records = json['records'] as int?
      ..query = json['query'] == null
          ? null
          : NsAppObjectsQuery.fromJson(json['query'] as Map<String, dynamic>)
      ..list = (json['list'] as List<dynamic>?)
          ?.map((e) => NsAppObject.fromJson(e as Map<String, dynamic>))
          .toList()
      ..notifyResult = json['notifyResult'] == null
          ? null
          : NsAppResult.fromJson(json['notifyResult'] as Map<String, dynamic>);

Map<String, dynamic> _$NsAppObjectQueryResultToJson(
        NsAppObjectQueryResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errorMessage': instance.errorMessage,
      'status': instance.status,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'records': instance.records,
      'query': instance.query?.toJson(),
      'list': instance.list?.map((e) => e.toJson()).toList(),
      'notifyResult': instance.notifyResult?.toJson(),
    };
