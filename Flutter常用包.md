# 常用包

1. shared_preferences - 本地存储包

可用来实现持久化存储，比如保存用户登录状态。

用法：

Global.dart
```dart
 
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_application/global/profile.dart';
import 'package:my_application/global/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  //引入变量
  static late SharedPreferences _prefs;

  static User user = User();
  static Profile profile = Profile();
  //初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();  //确保 Flutter 的绑定（binding）已经初始化
    _prefs = await SharedPreferences.getInstance(); //获取 SharedPreferences 的单例实例
    //读取本地缓存中的user和profile
    var user_ = _prefs.getString('user');
    var profile_ = _prefs.getString('profile');
    try {
     //如果缓存中有数据，则解析数据并更新user和profile
      if (user_ != null) {
        user = User.fromJson(jsonDecode(user_));
      }
      if (profile_ != null) {
        profile = Profile.fromJson(jsonDecode(profile_));
      }
    } catch (e) {
      //忽略
    }
  }

  //清除user并初始化User类更新数据
  static clearUser() {
    _prefs.remove('user');
    user = User();
  }

  //更新缓存 - 用户数据
  static saveUser() {
    _prefs.setString('user', jsonEncode(user));
  }

  // 更新缓存 - 版本号等
  static saveProfile() => _prefs.setString('profile', jsonEncode(profile));
}


```

2. provider - 状态管理包

用于实现状态管理，跨组件共享以及实时更新数据。

用法：

provider_data.dart
```dart

import 'package:flutter/material.dart';
import 'package:my_application/global/global.dart';
import 'package:my_application/global/profile.dart';
import 'package:my_application/global/user.dart';

class ProviderData extends ChangeNotifier {
  User get user => Global.user;
  Profile get profile => Global.profile;
  //获取登录状态
  bool get isLogin => user.isLogin;
  //获取版本号
  String get version => profile.version ?? '1.0.0';
  //退出登录
  void logout() {
    Global.clearUser();
    notifyListeners();
  }

  //修改用户表
  set user(User value) {
    if (value.userName != user.userName) {
      Global.user = value;
      Global.saveUser();
      notifyListeners();
    }
  }

  //修改版本号
  set profile(Profile value) {
    if (value.version != profile.version) {
      Global.profile = value;
      Global.saveProfile();
      notifyListeners();
    }
  }
}

```

3. json_annotation , build_runner , json_serializable - json序列化包

用于将json数据转换为dart对象，方便在dart中使用。

用法：

先创建user.dart模板代码 
```dart

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

```
然后在终端中运行以下命令：

```
flutter pub run build_runner build
```

插件将自动生成user.g.dart文件，其中包含User类的fromJson和toJson方法。

```dart

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userName: json['userName'] as String,
      passWord: json['passWord'] as String,
      token: json['token'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
      'passWord': instance.passWord,
      'token': instance.token,
      'avatar': instance.avatar,
    };


```

同理 还可生成profile.dart

```dart

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


```

profile.g.dart

```dart

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      version: json['version'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'version': instance.version,
    };


```

4. dio - 网络请求包

用于发送网络请求，支持get，post，put，delete等请求方式。

用法：

api.dart 

```dart

import 'package:dio/dio.dart';

/// 接口放这里
class Api {
  static const String baseUrl = "https://xxx.xx.com/";
  // 登录接口
  Future login(String username, String password) async {
    var dio = Dio();
    final formData = FormData.fromMap(
        {"account": username, "password": password, "openid": ""});
    var response = await dio.post("${baseUrl}api/user/login", data: formData);
    return response.data;
  }
}


```  

5. flutter_svg - svg图片包

用于加载svg图片，支持矢量图，可以缩放，不会失真。

展示base64用法：

```dart

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_application/my_provider/provider_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 获取Provider中的头像base64字符串
    //案例 ：
      "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgaGVpZ2h0PSIxMDAiIHdpZHRoPSIxMDAiPjxyZWN0IGZpbGw9InJnYigxODMsMTYwLDIyOSkiIHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIj48L3JlY3Q+PHRleHQgeD0iNTAiIHk9IjUwIiBmb250LXNpemU9IjUwIiB0ZXh0LWNvcHk9ImZhc3QiIGZpbGw9IiNmZmZmZmYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIHRleHQtcmlnaHRzPSJhZG1pbiIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPjE8L3RleHQ+PC9zdmc+";
    // 转换
    var base = Provider.of<ProviderData>(context).user.avatar ?? '';
    Uint8List bytes = base64Decode('');
    if (base != '') {
      bytes = base64Decode(base.split(',')[1]);
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<ProviderData>(context).user.userName ?? '暂无'),
            Text(Provider.of<ProviderData>(context).user.passWord ?? '暂无'),
            Text(Provider.of<ProviderData>(context).user.token ?? '暂无'),
            //显示svg图片
            SvgPicture.memory(bytes),
            ElevatedButton(
              onPressed: () {
                Provider.of<ProviderData>(context, listen: false).logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (router) => false);
              },
              child: Text("退出登录"),
            ),
          ],
        ),
      ),
    );
  }
}


```