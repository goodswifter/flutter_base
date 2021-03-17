import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    print("myapp - con");
  }

  @override
  Widget build(BuildContext context) {
    print("myapp - build");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatefulWidget的生命周期"),
        ),
        body: ADHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ADHomePage extends StatelessWidget {
  ADHomePage() {
    print("ADHomePage - contructor");
  }

  @override
  Widget build(BuildContext context) {
    print("StatelessWidget - build");
    return ADStatefulWidget();
  }
}

class ADStatefulWidget extends StatefulWidget {
  ADStatefulWidget() {
    print("1. 调用ADStatefulWidget的constructor方法");
  }

  @override
  _ADStatefulWidgetState createState() {
    print("2. ADStatefulWidget - createState");
    return _ADStatefulWidgetState();
  }
}

class _ADStatefulWidgetState extends State<ADStatefulWidget> {
  var _counter = 0;

  _ADStatefulWidgetState() {
    print("3. 调用_ADStatefulWidgetState的constructor方法");
  }

  @override
  // 注意: 如果父类有这个关键@mustCallSuper, 子类重写父类方法时, 必须调用父类的这个方法
  void initState() {
    super.initState();
    print("4. 调用_ADStatefulWidgetState的initState方法");
  }

  /// TODO: 什么时候调用?
  /// 当父Widget触发重建（rebuild）时，系统会调用didUpdateWidget方法；
  @override
  void didUpdateWidget(ADStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("state - didUpdateWidget");
  }

  /// TODO: 什么时候调用?
  /// 情况一：调用initState会调用；
  /// 情况二：从其他对象中依赖一些数据发生改变时，比如前面我们提到的InheritedWidget（这个后面会讲到）；
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("state - didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("5. 调用_ADStatefulWidgetState的build方法");
    return Center(
      child: Column(
        children: [
          RaisedButton(
              child: Text("+"),
              onPressed: () {
                setState(() {
                  _counter++;
                });
              }),
          Text("数字: $_counter")
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("6. 调用_ADStatefulWidgetState的dispose方法");
  }
}
