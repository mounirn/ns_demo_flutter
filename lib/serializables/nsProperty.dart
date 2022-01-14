import 'package:json_annotation/json_annotation.dart';

part 'nsProperty.g.dart';

@JsonSerializable(explicitToJson: true)
class NsProperty{
  int? id;
  int? classId;
  int? propertyId;
  String? value;
  NsProperty({this.classId, this.propertyId, this.value});

  factory NsProperty.fromJson(Map<String, dynamic> json) =>
      _$NsPropertyFromJson(json);

    Map<String, dynamic> toJson() => _$NsPropertyToJson(this);
}
