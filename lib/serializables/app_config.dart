import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';


@JsonSerializable(explicitToJson: true)
// Defines data for data entry
class NsAppConfig {
  String? serveRootUrl = "https://myOnlineObject.com";  
  int? id;
  int? clientId;
  String? code;
  String? name;
  String? description;
  String? imageUrl;

  NsAppConfig({serverRootUrl, this.id, this.code, this.name, this.description});

  factory NsAppConfig.fromJson(Map<String, dynamic> json) =>
      _$NsAppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppConfigToJson(this);
  
}