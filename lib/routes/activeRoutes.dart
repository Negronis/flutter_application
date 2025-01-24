import 'package:flutter/material.dart';
import 'package:my_application/pages/home.dart';
import 'package:my_application/pages/login.dart';

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
        }
        return Scaffold();
      },
    );
  }
}
