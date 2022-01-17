import 'package:json_annotation/json_annotation.dart';

part 'user_session.g.dart';

@JsonSerializable()
class NsUserSession {
  int? clienId;
  String? appId;
  int? accountId;
  String sessionId;
  String? emailAddress;
  String fullName; // screen name
  String? imageUrl;
  bool isActive;
  bool? isAdmin;
  bool? isSysAdmin;
  DateTime? createdOn;
  DateTime? lastAccess;
  String? fromIpAddress;
  int? mainRole;

  NsUserSession(
    this.sessionId,
    this.fullName,
    this.isActive,
  );

  factory NsUserSession.fromJson(Map<String, dynamic> json) =>
      _$NsUserSessionFromJson(json);

  Map<String, dynamic> toJson() => _$NsUserSessionToJson(this);

  @override toString(){
    return '$sessionId - $fullName - $emailAddress - ${isActive? "Active" : "Inactive"}';
  }
}
