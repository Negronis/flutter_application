import 'package:flutter/material.dart';
import 'package:my_application/pages/home.dart';

class Routes {
  BuildContext context;
  Routes({required this.context});
  Map<String, WidgetBuilder> routes = {
    '/': (context) => HomePage(),
  };
}
