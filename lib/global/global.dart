//全局变量，引入缓存
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
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    var user_ = _prefs.getString('user');
    print(user_);
    var profile_ = _prefs.getString('profile');
    try {
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
    print("123123");
    _prefs.remove('user');
    user = User();
  }

  //更新缓存 - 用户数据
  static saveUser() {
    _prefs.setString('user', jsonEncode(user));
    print(_prefs.getString('user'));
  }

  // 更新缓存 - 版本号等
  static saveProfile() => _prefs.setString('profile', jsonEncode(profile));
}
