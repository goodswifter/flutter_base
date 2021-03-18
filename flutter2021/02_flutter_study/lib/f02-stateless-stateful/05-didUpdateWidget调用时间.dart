import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    print("myapp - con");
  }

  @override
  Widget build(BuildContext context) {
    print("myapp - build");
    return MaterialApp(home: ADHomeDemo());
  }
}

class ADHomeDemo extends StatefulWidget {
  ADHomeDemo({Key key}) : super(key: key);

  @override
  _ADHomeDemoState createState() => _ADHomeDemoState();
}

class _ADHomeDemoState extends State<ADHomeDemo> {
  @override
  Widget build(BuildContext context) {
    print("ADHomeDemoState - build");
    return Scaffold(
      appBar: AppBar(
        title: Text("statefulWidget的生命周期"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ADHomeContent()],
      ),
      floatingActionButton: RaisedButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            ADHomeContent();
          });
        },
      ),
    );
  }
}

class ADHomeContent extends StatefulWidget {
  ADHomeContent({Key key}) : super(key: key);

  @override
  _ADHomeContentState createState() => _ADHomeContentState();
}

class _ADHomeContentState extends State<ADHomeContent> {
  var _counter = 0;

  /// TODO: 什么时候调用?
  /// 当父Widget触发重建（rebuild）时，系统会调用didUpdateWidget方法；
  @override
  void didUpdateWidget(ADHomeContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("ADHomeContentState - didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RaisedButton(
          child: Text("+"),
          onPressed: () {
            setState(() {
              _counter++;
            });
          }),
      Text("数字: $_counter"),
    ]);
  }
}
