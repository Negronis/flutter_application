import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

/// 应用配置 - 版本信息等
@JsonSerializable()
class Profile {
  final String? version; // 版本号
  Profile({this.version});
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
