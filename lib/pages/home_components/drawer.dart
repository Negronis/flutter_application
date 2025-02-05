import 'package:flutter/material.dart';
import 'package:my_application/my_provider/provider_data.dart';
import 'package:provider/provider.dart';

// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:flutter_svg/flutter_svg.dart';
class DrawerCom extends StatefulWidget {
  const DrawerCom({super.key});

  @override
  State<DrawerCom> createState() => _DrawerComState();
}

class _DrawerComState extends State<DrawerCom> {
  @override
  Widget build(BuildContext context) {
    // var base = Provider.of<ProviderData>(context).user.avatar ?? '';
    // Uint8List bytes = base64Decode('');
    // if (base != '') {
    //   bytes = base64Decode(base.split(',')[1]);
    // }
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
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            //加载背景图崩溃，原因未知
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    child: Image(
                      image: AssetImage('images/avatar.jpg'),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    // 读取svg base64
                    // SvgPicture.memory(
                    //   bytes,
                    //   width: 80,
                    //   height: 80,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            Provider.of<ProviderData>(context).user.userName ??
                                '暂无',
                      ),
                      TextSpan(
                        text: '，欢迎',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<ProviderData>(context, listen: false)
                            .logout();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (router) => false);
                      },
                      child: Text("退出登录"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
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
          ),
        ],
      ),
    );
  }
}
