import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 初始化
/// 1. iOS需要单独设置info.plist

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: ADI18nPage(),
      ),
    );
  }
}

class ADI18nPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "你好",
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
              );
            },
            child: Text(
              "选个一个时间",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
