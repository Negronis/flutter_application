import 'package:flutter/material.dart';
import 'package:my_application/util/dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var dialog = MyDialog(context: context);
    initState() {
      super.initState();
      dialog.showLoading();
    }

    return Scaffold(
      body: Center(
        child: Text("我是首页"),
      ),
    );
  }
}
