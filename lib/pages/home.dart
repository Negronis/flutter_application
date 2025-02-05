import 'package:flutter/material.dart';
import 'package:my_application/pages/bottom_page/data_page.dart';
import 'package:my_application/pages/bottom_page/home_page.dart';
import 'package:my_application/pages/bottom_page/user_page.dart';
import 'package:my_application/pages/home_components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //配置底部导航栏
  int bottomNavIndex = 0;
  List<Map> bottom = [
    {
      'label': "首页",
      'icon': Icon(Icons.home),
    },
    {
      "label": "数据",
      "icon": Icon(Icons.data_saver_off),
    },
    {
      "label": "我的",
      "icon": Icon(Icons.person),
    }
  ];
  // 配置页面
  List<Widget> pages = [HomeContentPage(), DataPage(), UserPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(bottom[bottomNavIndex]['label'].toString()),
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: IconButton(
              icon: Icon(Icons.abc),
              onPressed: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        items: bottom.map(
          (e) {
            return BottomNavigationBarItem(icon: e['icon'], label: e['label']);
          },
        ).toList(),
        onTap: (value) {
          setState(() {
            bottomNavIndex = value;
          });
        },
      ),
      drawer: DrawerCom(),
      body: pages[bottomNavIndex],
    );
  }
}
