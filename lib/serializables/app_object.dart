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

/// Defines an object preference / option
/// Sample Data: 
/// {"id":2167,"appObjectId":1,"key":"IndustryId","baseType":10103,"htmlType":0,"value":"10302"}
@JsonSerializable(explicitToJson: true)
class NsAppObjectPreference {
  int id;
  int appObjectId;
  String key;
  String value;
  int baseType;
  int htmlType;

  NsAppObjectPreference(this.id, this.appObjectId, this.key, this.value, this.baseType, this.htmlType);
 
  factory NsAppObjectPreference.fromJson(Map<String, dynamic> json) =>
      _$NsAppObjectPreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppObjectPreferenceToJson(this);
}

/// Defines a set of colors for an object
/// "colors":{"color":"#000000","bkColor":"#f7f7f7",
/// "headerColor":"#0080ef","headerBKColor":"#ccddcc", "footerColor":"#ccddcc", 
/// "footerBKColor":"#0080ef","borderColor":"#0080ef", "titleColor":"#ccffdd"},
@JsonSerializable(explicitToJson: true)
class NsAppObjectColors {
  String? color;
  String? bkColor;
  String? headerColor;
  String? headerBKColor;
  String? footerColor;
  String? footerBKColor;
  String? borderColor;
  String? titleColor;
  
  NsAppObjectColors();

  factory NsAppObjectColors.fromJson(Map<String, dynamic> json) =>
      _$NsAppObjectColorsFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppObjectColorsToJson(this);
}

/// Defines an address
/// Sample data: {"id":"00000000-0000-0000-0000-000000000000",
///    "objectId":0,
///    "type":10,
///    "line1":
///    "1 Rowe Court",
///    "line2":null,
///    "city":"Alameda",
///    "stateProvince":"CA",
///    "zipPostalCode":"94501",
///    "countryId":10381},
@JsonSerializable(explicitToJson: true)
class NsAppObjectAddress {
  String? id;
  int? objectId;
  String? line1;
  String? line2;
  String? city;
  String? stateProvince;
  String? zipPostalCode;
  int? countryId;
  
  NsAppObjectAddress();

  factory NsAppObjectAddress.fromJson(Map<String, dynamic> json) =>
      _$NsAppObjectAddressFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppObjectAddressToJson(this);
}

/// Defines a generic app object
@JsonSerializable(explicitToJson: true)
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
  List<NsAppObjectPreference>? preferences;
  NsAppObjectColors? colors;
  NsAppObjectAddress? address;

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