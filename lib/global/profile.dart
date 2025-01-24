import 'package:json_annotation/json_annotation.dart';

part 'Profile.g.dart';

@JsonSerializable()
class Profile {
  final String version; // 版本号
  Profile({required this.version});
  factory Profile.fromJson(Map<String ,dynamic>)=> _$ProfileFromJson();
  Map<String,dynamic> toJson()=>_$ProfileToJson(this);
}
