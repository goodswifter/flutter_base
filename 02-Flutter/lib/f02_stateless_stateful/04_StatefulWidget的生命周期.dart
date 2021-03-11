import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("StatefulWidget的生命周期"),),
        body: ADHomePage(),
      ),
    );
  }
}

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  int _counter = 0;

  _ADStatefulWidgetState() {
    print("3. 调用_ADStatefulWidgetState的constructor方法");
  }

  @override
  // 注意: 如果父类有这个关键@mustCallSuper, 子类重写父类方法时, 必须调用父类的这个方法
  void initState() {
    super.initState();
    print("4. 调用_ADStatefulWidgetState的initState方法");
  }

  /// 什么时候调用?
  @override
  void didUpdateWidget(ADStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("state - didUpdateWidget");
  }

  /// 什么时候调用?
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
          ),
          Text("数字:$_counter")
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
