import 'package:flutter/material.dart';
import 'package:my_application/pages/home.dart';
import 'package:my_application/pages/login.dart';
import 'package:my_application/pages/setting.dart';

class Activeroutes {
  BuildContext context;
  Activeroutes({required this.context});
  initActiveRoutes(RouteSettings settings, bool isLogin) {
    return MaterialPageRoute(
      builder: (context) {
        var routename = settings.name;
        if (isLogin == false) {
          return LoginPage();
        }
        switch (routename) {
          case '/':
            return HomePage();
          case '/setting':
            return SettingPage();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('页面不见啦'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('页面不见啦'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (router) => false);
                    },
                    child: Text('返回首页'))
              ],
            ),
          ),
        );
      },
    );
  }
}
