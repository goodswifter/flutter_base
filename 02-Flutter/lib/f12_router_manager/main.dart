import 'package:flutter/material.dart';

import 'router/router.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "路由跳转",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
      ),
      routes: ADRouter.routes,
      initialRoute: ADRouter.initialRoute,
      onGenerateRoute: ADRouter.generateRoute,
      onUnknownRoute: ADRouter.unknownRoute,
    );
  }
}
