import 'package:json_annotation/json_annotation.dart';

part 'user_session.g.dart';

@JsonSerializable()
class UserSession {
  String? sessionId;
  String? email;
  String? fullName;
  String? imageUrl;
  bool? isActive;
  bool? isAdmin;
  bool? isSysAdmin;
  DateTime? lastAccess;
  UserSession({
    this.sessionId,
    this.email,
    this.fullName,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionToJson(this);
}
