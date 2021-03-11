import 'package:flutter/material.dart';

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

// StatefulWidget: 继承自StatefulWidget的类(可以接收父Widget传过来的数据)/State类(状态)
// flag: 状态
// Stateful不能定义状态 -> 创建一个单独的类, 这个类负责维护状态
class ADHomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ADHomeBodyState();
  }
}

class ADHomeBodyState extends State<ADHomeBody> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          // 主轴对齐方式
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: flag,
              onChanged: (value) {
                this.setState(() {
                  flag = value;
                });
              },
            ),
            Text("同意协议", style: TextStyle(fontSize: 20),)
          ],
        )
    );
  }
}