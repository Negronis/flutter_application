import 'package:flutter/material.dart';
import 'package:my_application/global/global.dart';
import 'package:my_application/my_provider/provider_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  Global.init().then((e) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderData>(create: (_) => ProviderData()),
      ],
      child: MaterialApp(
        home: Scaffold(body: Center(
          child: Builder(
            builder: (BuildContext context) {
              return Center(
                child: Text(Provider.of<ProviderData>(context).version),
              );
            },
          ),
        )),
      ),
    );
  }
}
