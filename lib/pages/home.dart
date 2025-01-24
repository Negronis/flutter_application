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
