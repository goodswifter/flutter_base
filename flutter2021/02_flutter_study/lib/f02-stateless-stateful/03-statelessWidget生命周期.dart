import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatelessWidget的生命周期"),
        ),
        body: ADHomeBody(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ADHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ADStatelessWidget("StatelessWidget的生命周期");
  }
}

class ADStatelessWidget extends StatelessWidget {
  final String message;

  ADStatelessWidget(this.message) {
    print("1. 构造函数被调用");
  }

  @override
  Widget build(BuildContext context) {
    print("2. 调用build方法");
    return Center(
      child: Text(
        message,
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
