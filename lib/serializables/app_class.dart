import 'package:json_annotation/json_annotation.dart';

import 'app_object.dart';

part 'app_class.g.dart';

@JsonSerializable(explicitToJson: true)
class NsAppClassResponsibility extends NsAppObject {
  NsAppClassResponsibility();
  factory NsAppClassResponsibility.fromJson(Map<String, dynamic> json) =>
      _$NsAppClassResponsibilityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NsAppClassResponsibilityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NsAppClassCollaboration extends NsAppObject {
  NsAppClassCollaboration();
  factory NsAppClassCollaboration.fromJson(Map<String, dynamic> json) =>
      _$NsAppClassCollaborationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NsAppClassCollaborationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NsAppClassProperty extends NsAppObject {
  NsAppClassProperty();

  factory NsAppClassProperty.fromJson(Map<String, dynamic> json) =>
      _$NsAppClassPropertyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NsAppClassPropertyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NsAppClass extends NsAppObject {
 
  List<NsAppClassResponsibility>? responsibilities;
  List<NsAppClassCollaboration>? collaborations;
  List<NsAppClassProperty>? propertyDefinitions;

  NsAppClass();

  factory NsAppClass.fromJson(Map<String, dynamic> json) =>
      _$NsAppClassFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NsAppClassToJson(this);
  
  @override toString() {
    return '$id $clientId $name';
  }
}
