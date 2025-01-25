import 'package:flutter/material.dart';
import 'package:my_application/global/global.dart';
import 'package:my_application/my_provider/provider_data.dart';
import 'package:my_application/routes/activeRoutes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // ignore: invalid_use_of_visible_for_testing_member
  //项目初始化时，在模拟器运行如果报错解开，但是运行完成后需要注释，否则存储会失败
  // SharedPreferences.setMockInitialValues({});
  Global.init().then((e) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var activeRoutes = Activeroutes(context: context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProviderData>(create: (_) => ProviderData()),
        ],
        builder: (context2, _) => MaterialApp(
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) =>
                  activeRoutes.initActiveRoutes(
                      settings,
                      Provider.of<ProviderData>(context2, listen: false)
                          .isLogin),
            ));
  }
}
