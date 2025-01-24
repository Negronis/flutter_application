import 'package:dio/dio.dart';

/// 接口放这里
class Api {
  static const String baseUrl = "https://ccc.hebzhhd.com/";
  // 登录接口
  Future login(String username, String password) async {
    var dio = Dio();
    final formData = FormData.fromMap(
        {"account": username, "password": password, "openid": ""});
    var response = await dio.post("${baseUrl}api/user/login", data: formData);
    return response.data;
  }
}
