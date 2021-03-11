import 'package:flutter/material.dart';

import '03_event_bus.dart';

// 1. 创建全局的EventBus对象
class UserInfo {
  String nickname;
  int level;

  UserInfo(this.nickname, this.level);
}

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => print("FloatingActionButton Click"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: Center(child: ADHomeContent()),
      ),
    );
  }
}

class ADHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ADButton(),
          ADText()
        ],
      ),
    );
  }
}

class ADButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("按钮"),
      onPressed: () {
        // 2. 发出事件
        final info = UserInfo("zad", 18);
        eventBus.fire(info);
      },
    );
  }
}

class ADText extends StatefulWidget {
  @override
  _ADTextState createState() => _ADTextState();
}

class _ADTextState extends State<ADText> {
  String _message = "Hello World";

  @override
  void initState() {
    super.initState();

    // 3. 监听事件的类型
    eventBus.on<UserInfo>().listen((data) {
      print(data.nickname);
      print(data.level);
      setState(() {
        _message = "${data.nickname} - ${data.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message, style: TextStyle(fontSize: 20),);
  }
}


