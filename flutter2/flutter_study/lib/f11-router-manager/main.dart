import 'package:flutter/material.dart';
import 'package:flutter_study/f11-router-manager/router/router.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "router路由跳转",
      theme: ThemeData(
        primaryColor: Colors.blue,
        splashColor: Colors.transparent,
      ),
      routes: ADRouter.routes,
      initialRoute: ADRouter.initialRoute,
      onUnknownRoute: ADRouter.unknownRoute,
      onGenerateRoute: ADRouter.generateRoute,
    );
  }
}
