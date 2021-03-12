import 'package:flutter/material.dart';
import 'package:flutter_study/f10-event-listener/event_bus.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("event_bus"),
        ),
        body: ADHomeContent(),
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
        children: [
          ADButton(),
          ADText(),
        ],
      ),
    );
  }
}

class ADText extends StatefulWidget {
  @override
  _ADTextState createState() => _ADTextState();
}

class _ADTextState extends State<ADText> {
  String _title = "Hello World";

  @override
  void initState() {
    super.initState();

    // 3. 监听事件类型
    eventBus.on<UserInfo>().listen((event) {
      print(event.name);
      print(event.age);
      setState(() {
        _title = "${event.name} - ${event.age}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 30),
    );
  }
}

class ADButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 2. 发送事件
        final info = UserInfo("zad", 18);
        eventBus.fire(info);
      },
      child: Text(
        "按钮",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class UserInfo {
  String name;
  int age;
  UserInfo(this.name, this.age);
}
