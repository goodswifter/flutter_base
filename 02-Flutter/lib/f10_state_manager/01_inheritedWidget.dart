import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class ADCounterWidget extends InheritedWidget {
  // 1. 共享的数据
  final int counter;

  // 2. 定义构造方法
  ADCounterWidget({this.counter, Widget child}): super(child: child);

  // 3. 找到当前Widget树中最近的InheritedWidget
  static ADCounterWidget of(BuildContext context) {
    // 沿着Element树, 去找到最近的ADCounterElement, 从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4. 要不要回调State中的didChangeDependencies方法
  @override
  bool updateShouldNotify(ADCounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ADHomePage(),
    );
  }
}

class ADHomePage extends StatefulWidget {
  @override
  _ADHomePageState createState() => _ADHomePageState();
}

class _ADHomePageState extends State<ADHomePage> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ADHomeContent(_counter),
    );
  }
}


class ADHomeContent extends StatelessWidget {
  final int counter;

  ADHomeContent(this.counter);

  @override
  Widget build(BuildContext context) {
    return ADCounterWidget(
      counter: counter,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ADShowData01(),
            ADShowData02()
          ],
        ),
      ),
    );
  }
}

class ADShowData01 extends StatefulWidget {
  @override
  _ADShowData01State createState() => _ADShowData01State();
}

class _ADShowData01State extends State<ADShowData01> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了_ADShowData01State中的didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    int counter = ADCounterWidget.of(context).counter;

    return Card(
      color: Colors.red,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30),),
    );
  }
}

class ADShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = ADCounterWidget.of(context).counter;

    return Container(
      color: Colors.blue,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30),),
    );
  }
}