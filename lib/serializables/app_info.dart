import 'package:json_annotation/json_annotation.dart';

import 'app_object.dart';

part 'app_info.g.dart';


@JsonSerializable(explicitToJson: true)
// Defines data for data entry
class NsAppInfo extends NsAppObject {
 
  String? subDomain;
  String? url;
 

  NsAppInfo();

  factory NsAppInfo.fromJson(Map<String, dynamic> json) =>
      _$NsAppInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NsAppInfoToJson(this);
  
  @override toString() {
    return '$id $clientId $name $url $imageUrl';
  }
}