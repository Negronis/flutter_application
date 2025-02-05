import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_application/api/api.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final TextEditingController search = TextEditingController();
  //定义stream控制器
  late StreamController streamController = StreamController.broadcast();
  final Api api = Api();

  Future<dynamic> getData() async {
    try {
      var res = await api.getList();
      if (res['code'] != 1) {
        streamController.add(res);
      }
      res['data'] = res['data'].where((e) {
        return e['hzxm'].toString().contains(search.text);
      }).toList();
      streamController.add(res);
    } catch (err) {
      streamController.add(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: TextField(
                      controller: search,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        hintText: "输入姓名进行搜索",
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        streamController.add(null);
                        getData();
                      },
                      icon: Icon(Icons.search),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyDataCom(
              search: search.text,
              streamController: streamController,
            ),
          )
        ],
      ),
    );
  }
}

//数据列表
class MyDataCom extends StatefulWidget {
  final String search;
  final StreamController streamController;
  const MyDataCom(
      {super.key, required this.search, required this.streamController});
  @override
  State<MyDataCom> createState() => _MyDataComState();
}

class _MyDataComState extends State<MyDataCom> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("数据加载中，请稍后"),
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.data['code'] == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline),
                Text("数据为空"),
              ],
            ),
          );
        }
        if (snapshot.data['code'] == 1 && snapshot.data['data'].length == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline),
                Text("没有找到相关数据"),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFADD8E6),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.blue[50],
                  ),
                  child: ListTile(
                    title: Text(snapshot.data['data'][index]['hzxm']),
                    subtitle:
                        Text(snapshot.data['data'][index]['xh'].toString()),
                    trailing: Text(snapshot.data['data'][index]['yfmc']),
                  ),
                ),
              );
            },
            itemCount: snapshot.data['data'].length,
          ),
        );
      },
      stream: widget.streamController.stream,
    );
  }
}
