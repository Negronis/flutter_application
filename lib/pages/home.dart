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
    //配置Drawer
    List<Map> list = [
      {
        'text': "设置",
        'icon': Icon(Icons.settings),
        'tap': () {
          Navigator.pushNamed(context, '/setting');
        }
      }
    ];
    var base = Provider.of<ProviderData>(context).user.avatar ?? '';
    Uint8List bytes = base64Decode('');
    if (base != '') {
      bytes = base64Decode(base.split(',')[1]);
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('首页'),
        ),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          Container(
              height: 200,
              //加载背景图崩溃，原因未知
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: SvgPicture.memory(
                        bytes,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: Provider.of<ProviderData>(context)
                                    .user
                                    .userName ??
                                '暂无',
                          ),
                          TextSpan(text: '，欢迎'),
                        ],
                      ),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: list[index]['icon'],
                  title: Text(list[index]['text']),
                  onTap: list[index]['tap'],
                );
              },
            ),
          ),
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<ProviderData>(context).user.userName ?? '暂无'),
            Text(Provider.of<ProviderData>(context).user.passWord ?? '暂无'),
            Text(Provider.of<ProviderData>(context).user.token ?? '暂无'),
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
