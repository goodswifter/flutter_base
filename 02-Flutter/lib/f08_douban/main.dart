
import 'package:flutter/material.dart';
import 'pages/main/main.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
      ),
      home: ADMainPage(),
    );
  }
}

class ADHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ADMainPage();
  }
}