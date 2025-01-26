import 'package:flutter/material.dart';

class MyinfoPage extends StatefulWidget {
  const MyinfoPage({super.key});

  @override
  State<MyinfoPage> createState() => _MyinfoPageState();
}

class _MyinfoPageState extends State<MyinfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
      appBar: AppBar(
        title: Text('你好'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}
