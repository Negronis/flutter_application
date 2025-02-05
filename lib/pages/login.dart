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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: AssetImage('images/banner.png'),
                ),
                Center(
                  child: Text(
                    '欢迎登录',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    'W E L C O M E   T O   L O G I N',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6 + 50,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: '用户名',
                      labelStyle: TextStyle(fontSize: 16),
                      hintText: "请输入用户名",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(122, 20, 200, .4),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(122, 20, 200, .8),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: '密码',
                      hintText: "请输入密码",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(122, 20, 200, .4),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(122, 20, 200, .8),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 50, 125, 250),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () async {
                  dialog.showLoading();
                  var api = await Api().login('15733586963', '123456');
                  dialog.hideLoading();
                  if (api['code'] == 1) {
                    Map apiData = api['data'];
                    Map userInfo = apiData['userinfo'];
                    setState(() {
                      User? user;
                      user = User.fromJson({
                        'userName': userInfo['username'],
                        'passWord': "123456",
                        'token': userInfo['token'],
                        'avatar': userInfo['avatar'],
                      });
                      Provider.of<ProviderData>(context, listen: false).user =
                          user;
                      Navigator.pushNamed(context, '/');
                    });
                  } else {
                    dialog.showMsgDialog('', api['msg']);
                  }
                },
                child: Text(
                  "登录",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
