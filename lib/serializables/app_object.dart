import 'package:json_annotation/json_annotation.dart';
// import 'nsProperty.dart';

part 'app_object.g.dart';


@JsonSerializable(explicitToJson: true)
// Defines data for data entry
class NsAppObject {
  int? id;
  int? clientId;
  String? code;
  String? name;
  String? description;
  String? imageUrl;
  int? classId;
  int? typeId;
  int? managerId;
  int? isAssignedTo;
  int? status;
  bool? isActive;
  bool? isPublic;
  bool? isRequired;
  DateTime? createdOn;
  int? createdBy;
  int? lastEditBy;
  DateTime? lastEditOn;
  String? lastEditFrom;
  int? displayOrder;

  NsAppObject();

  factory NsAppObject.fromJson(Map<String, dynamic> json) =>
      _$NsAppObjectFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppObjectToJson(this);
  

  @override
  int get hashCode => id!;

  @override
  bool operator ==(Object other) => other is NsAppObject && other.id == id;

  @override toString() {
    return 'manager Id: $managerId $clientId.$id $name ($code) ${isActive == true? "Active": "Inactive"}';
  }
}