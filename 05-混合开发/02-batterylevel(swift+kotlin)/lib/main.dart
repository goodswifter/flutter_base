import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: ADHomePage(),
    );
  }
}

class ADHomePage extends StatefulWidget {
  // 1. 创建一个route名称
  static const String routeName = "/battery";

  @override
  _ADHomePageState createState() => _ADHomePageState();
}

class _ADHomePageState extends State<ADHomePage> {
  // 2. 创建MethodChannel对象
  static const platform = const MethodChannel(("zad.com/battery"));
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Battery"),
      ),
      body:  Center(
        child: Column(
          children: <Widget>[
            Text("当前电池信息: $_result"),
            RaisedButton(
              child: Text("获取电池信息"),
              onPressed: getBatteryInfo,
            )
          ],
        ),
      ),
    );
  }

  void getBatteryInfo() async {
    // 3. 调用宿主平台的方法
    final int result = await platform.invokeMethod("getBatteryInfo");
    setState(() => _result = result);
  }
}