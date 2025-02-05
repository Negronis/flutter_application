import 'package:flutter/material.dart';
import 'package:my_application/my_provider/provider_data.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List myFunction = [
    {"label": "功能1", "icon": Icons.ac_unit_sharp},
    {"label": "功能2", "icon": Icons.ac_unit_sharp},
    {"label": "功能3", "icon": Icons.ac_unit_sharp},
    {
      "label": "退出登录",
      "icon": Icons.ac_unit_sharp,
      "tap": (context) {
        Provider.of<ProviderData>(context, listen: false).logout();
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (user) => false);
      }
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 4,
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Image(
                          image: AssetImage('images/avatar.jpg'),
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              Provider.of<ProviderData>(context)
                                  .user
                                  .userName
                                  .toString(),
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 15),
                            child: Text(
                              '欢迎使用',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(myFunction[index]["icon"]),
                  title: Text(myFunction[index]["label"]),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    if (myFunction[index]['tap'] != null) {
                      myFunction[index]['tap'](context);
                    }
                  },
                );
              },
              itemCount: myFunction.length,
            ),
          )
        ],
      ),
    );
  }
}
