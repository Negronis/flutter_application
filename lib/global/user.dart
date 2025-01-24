import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// 用户表
/// 保存用户的登录信息，包括用户名，密码，token，头像等
@JsonSerializable()
class User {
  final String? userName;
  final String? passWord;
  final String? token;
  final String? avatar;
  get isLogin => token != null;
  User({
    this.userName,
    this.passWord,
    this.token,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
