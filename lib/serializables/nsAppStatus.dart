import 'package:json_annotation/json_annotation.dart';

part 'nsAppStatus.g.dart';


@JsonSerializable(explicitToJson: true)
class NsAppStatus {
  String appId = '';
  int clientId = 1;
  String appDomainInfo = '';
  String name = 'Unknown';
  String rootDir = '';
  bool startedOK = false;
  DateTime? lastStartupTime;
  int numberOfRequestsSinceStartup = 0;
  String? version;
  String lastUpdate = '';
  late DateTime currentTime;
  String serverInfo = '';
  int apiControllersCurrentCount = 0;
  int  dataStoreCurrentCount = 0;
  int dataStoresTotalUsedCount = 0;
  int servicesCurrentCount = 0;
  int servicesTotalUsedCount = 0;

  NsAppStatus({this.version});

  factory NsAppStatus.fromJson(Map<String, dynamic> json) =>
      _$NsAppStatusFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppStatusToJson(this);
   
  @override
  String toString() =>
      'App ID: $appId, $name, clientId: $clientId, last Startup Time: $lastStartupTime, number of requests since last startup: $numberOfRequestsSinceStartup';

}