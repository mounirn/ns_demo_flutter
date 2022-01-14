import 'package:json_annotation/json_annotation.dart';
// import 'nsProperty.dart';

part 'nsObject.g.dart';


@JsonSerializable(explicitToJson: true)
// Defines data for data entry
class NsObject {
  int? id;
  String? code;
  String? name;
  String? description;
  String? imageUrl;
  int? classId;
  int? typeId;
//  Map<String, String> options; 
//  List<NsProperty>? props; 
  NsObject({this.id, this.code, this.name, this.description, this.classId, this.typeId});

  factory NsObject.fromJson(Map<String, dynamic> json) =>
      _$NsObjectFromJson(json);
  
}