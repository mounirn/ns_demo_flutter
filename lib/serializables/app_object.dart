import 'package:json_annotation/json_annotation.dart';
part 'app_object.g.dart';

/// Defines an object property
/// Sample Data: 
/// {"id":4,"appObjectId":2,"propertyId":11650,"value":"fa878ced-75f3-42a9-a53f-5e5ecfaa01df"}
@JsonSerializable(explicitToJson: true)
class NsAppObjectProperty {
  int id;
  int appObjectId;
  int propertyId;
  String value;
  NsAppObjectProperty(this.id, this.appObjectId, this.propertyId, this.value);
 
 factory NsAppObjectProperty.fromJson(Map<String, dynamic> json) =>
      _$NsAppObjectPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppObjectPropertyToJson(this);
}

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

  List<NsAppObjectProperty>? properties;

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

@JsonSerializable(explicitToJson: true)
class NsAppObjectsQuery {
  
  int? ownerId;
  int? hasClassId;
  int? hasBuiltInTypeId;
  int? hasManagerId;
  String? hasCode;
  String? nameContains;

  NsAppObjectsQuery();

  factory NsAppObjectsQuery.fromJson(Map<String, dynamic> json) =>
      _$NsAppObjectsQueryFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppObjectsQueryToJson(this);
}