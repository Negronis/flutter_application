import 'package:flutter/material.dart';
import 'package:my_application/api/api.dart';
import 'package:my_application/global/user.dart';
import 'package:my_application/my_provider/provider_data.dart';
import 'package:my_application/util/dialog.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var dialog = MyDialog(context: context);
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              "用户名:${Provider.of<ProviderData>(context).user.userName ?? '暂无用户名'}"),
          ElevatedButton(
            onPressed: () async {
              dialog.showLoading();
              var api = await Api().login('15733586963', '123456');
              dialog.hideLoading();
              if (api['code'] == 1) {
                Map apiData = api['data'];
                Map userInfo = apiData['userinfo'];
                User? user;
                user = User.fromJson({
                  'userName': userInfo['username'],
                  'passWord': "123456",
                  'token': userInfo['token'],
                  'avatar': userInfo['avatar'],
                });
                Provider.of<ProviderData>(context, listen: false).user = user;
                Navigator.pushNamed(context, '/');
              } else {
                dialog.showMsgDialog('', api['msg']);
              }
            },
            child: Text("登录"),
          ),
        ]),
      ),
    );
  }
}
