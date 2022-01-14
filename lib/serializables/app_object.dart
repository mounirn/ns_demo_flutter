import 'package:json_annotation/json_annotation.dart';
// import 'nsProperty.dart';

part 'app_object.g.dart';


@JsonSerializable(explicitToJson: true)
// Defines data for data entry
class NsAppObject {
  int? id;
  String? code;
  String? name;
  String? description;
  String? imageUrl;
  int? classId;
  int? typeId;
//  Map<String, String> options; 
//  List<NsProperty>? props; 
  NsAppObject({this.id, this.code, this.name, this.description, this.classId, this.typeId});

  factory NsAppObject.fromJson(Map<String, dynamic> json) =>
      _$NsAppObjectFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppObjectToJson(this);
  
}