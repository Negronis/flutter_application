import 'package:flutter/material.dart';

///实现弹窗和Loading框
class MyDialog {
  BuildContext context;
  MyDialog({required this.context});
  //实现弹窗确认功能
  void showMsgDialog(String? title, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title ?? '提示'),
            content: Text(content),
            actions: [
              TextButton(
                child: Text("确定"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  //实现Loading
  void showLoading() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 26.0),
                  child: Text("加载中..."),
                )
              ],
            ),
          );
        });
  }

  void hideLoading() {
    Navigator.pop(context);
  }
}
