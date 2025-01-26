import 'dart:async';

// import 'package:dio/dio.dart';

/// 接口放这里
class Api {
  static const String baseUrl = "https://ccc.hebzhhd.com/";

  //模拟登录
  Future mockLogin() async {
    return await Future.delayed(Duration(seconds: 2), () {
      return {
        "code": 1,
        "data": {
          "userinfo": {
            "token": "1234567890",
            "username": "admin",
            'password': '123456',
            'avatar':
                "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgaGVpZ2h0PSIxMDAiIHdpZHRoPSIxMDAiPjxyZWN0IGZpbGw9InJnYigxODMsMTYwLDIyOSkiIHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48L3JlY3Q+PHRleHQgeD0iNTAiIHk9IjUwIiBmb250LXNpemU9IjUwIiB0ZXh0LWNvcHk9ImZhc3QiIGZpbGw9IiNmZmZmZmYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIHRleHQtcmlnaHRzPSJhZG1pbiIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPjE8L3RleHQ+PC9zdmc+"
          }
        },
        "msg": "登录成功"
      };
    });
  }

  // 登录接口
  Future login(String username, String password) async {
    // var dio = Dio();
    // final formData = FormData.fromMap(
    //     {"account": username, "password": password, "openid": ""});
    // var response = await dio.post("${baseUrl}api/user/login", data: formData);
    // return response.data;
    return await mockLogin();
  }
}
