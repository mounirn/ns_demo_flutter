import 'package:json_annotation/json_annotation.dart';

part 'app_object_property.g.dart';

@JsonSerializable(explicitToJson: true)
class NsAppObjectProperty{
  int? id;
  int? classId;
  int? propertyId;
  String? value;
  NsAppObjectProperty({this.classId, this.propertyId, this.value});

  factory NsAppObjectProperty.fromJson(Map<String, dynamic> json) =>
      _$NsAppObjectPropertyFromJson(json);

    Map<String, dynamic> toJson() => _$NsAppObjectPropertyToJson(this);
}
