import 'package:json_annotation/json_annotation.dart';
import 'app_object.dart';

part 'app_type.g.dart';

@JsonSerializable(explicitToJson: true)
class NsAppType extends NsAppObject {
  String? desc;

  
  NsAppType();

  factory NsAppType.fromJson(Map<String, dynamic> json) =>
      _$NsAppTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NsAppTypeToJson(this);
  
  @override toString() {
    return '$id $managerId $name $desc';
  }
}