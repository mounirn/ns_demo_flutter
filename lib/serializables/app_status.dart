import 'package:json_annotation/json_annotation.dart';

part 'app_status.g.dart';


@JsonSerializable(explicitToJson: true)
class NsAppStatus {
  String? appId;
  int? clientId;
  String? appDomainInfo;
  String? name;
  String? rootDir;
  bool? startedOK;
  DateTime? lastStartupTime;
  int numberOfRequestsSinceStartup = 0;
  String? version;
  String? versionDate;
  DateTime? currentTime;
  String? serverInfo = '';
  int apiControllersCurrentCount = 0;
  int dataStoreCurrentCount = 0;
  int dataStoresTotalUsedCount = 0;
  int servicesCurrentCount = 0;
  int servicesTotalUsedCount = 0;
  
  NsAppStatus();

  factory NsAppStatus.fromJson(Map<String, dynamic> json) =>
      _$NsAppStatusFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppStatusToJson(this);
   
  @override
  String toString() =>
      'App ID: $appId, $name, clientId: $clientId, last Startup Time: $lastStartupTime, number of requests since last startup: $numberOfRequestsSinceStartup';

}