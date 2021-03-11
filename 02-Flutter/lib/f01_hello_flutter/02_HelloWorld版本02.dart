import 'package:flutter/material.dart';

//main() {
//  runApp(MyApp());
//}
main() => runApp(MyApp());

/// Widget:
/// 有状态的Widget: StatefulWidget 在运行过程中有一些状态(data)需要改变
/// 无状态的Widget: StatelessWidget 内容是确定没有状态(data)的改变

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ADHomePage(), debugShowCheckedModeBanner: false);
  }
}

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("第一个Flutter程序")),
      body: ADHomeBody(),
    );
  }
}

class ADHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello World",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 36, color: Colors.red),
      ),
    );
  }
}
