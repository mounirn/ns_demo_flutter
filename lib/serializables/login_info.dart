import 'package:json_annotation/json_annotation.dart';

part 'login_info.g.dart';

@JsonSerializable()
class LoginInfo {
  String? username;
  String? password;

  LoginInfo({
    this.username,
    this.password,
  });

  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);

  bool invalid() {
    if (username == null || username?.isEmpty == true){
      return true;
    }
   
    if (password == null || password?.isEmpty == true){
      return true;
    }
    return false;
  }
}
