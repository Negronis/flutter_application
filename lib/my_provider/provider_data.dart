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
      profile = value;
      Global.saveProfile();
      notifyListeners();
    }
  }
}
