import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

/// Defines app configuration to be loaded from server or from 
/// local assets
@JsonSerializable(explicitToJson: true)
class NsAppConfig {
  String? apiUrl = "https://myOnlineObject.com";  
  String? apiUrlDev;
  String? apiUrlDebug;
  String? apiUrlTest;
  String? apiAuthToken;
  int? appId;
  int? appClientId;
  int? appObjectId;
  String? code;
  String? appName;
  String? appVersion;
  String? description;
  String? imageUrl;

  NsAppConfig();

  factory NsAppConfig.fromJson(Map<String, dynamic> json) =>
      _$NsAppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppConfigToJson(this);
  
}

/*  Sample config
{
    "apiUrlDev": "http://localhost/dev/MyOnlineObjects",
    "apiUrl": "https://MyOnlineObjects.com",
    "apiUrlDebug": "http://localhost:23121",
    "appServerChoices" : [ 
        { "name": "Development", "url": "http://localhost/dev/MyOnlineObjects" } , 
        { "name": "Test","url" : "http://api.kharbga.com" },
        { "name": "Production", "url": "https://MyOnlineObjects.com" },
        { "name": "Debug", "url": "http://localhost:23121" }
    ] ,
    "teams": [],
    "countries": [{ "id":1, "name":"Tunisia"}, {"id": 2, "name": "USA"} ],
    "industries": [{ "id":100, "name": "Education"} ], 
    "appName": "Online Objects",
    "appId" : 1,
    "appDeveloperSystemId" : "99d1727a-964c-4285-9ae2-87b8bcafd338",
    "apiAuthToken" : "{YOUR TOKEN HERE -- Created in the My Online Objects System API Subscription Module}",
    "appClientId" : 1, 
    "appClientSystemId" : "99d1727a-964c-4285-9ae2-87b8bcafd338",
    "appObjectId" : 123, 
    "appObjectSystemId" : "99d1727a-964c-4285-9ae2-87b8bcafd338"
}
*/