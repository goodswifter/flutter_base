import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatefulWidget的生命周期"),
        ),
        body: ADStatefulWidget(),
      ),
    );
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
  /// 初始化时，在initState()之后立刻调用
  /// 当依赖的InheritedWidget rebuild, 会触发此接口被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("5. 调用_ADStatefulWidgetState的 didChangeDependencies 方法");
  }

  /// 什么时候调用?
  /// 当树 rebuild 的时候会调用该方法
  @override
  void didUpdateWidget(ADStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("6. 调用_ADStatefulWidgetState的 didUpdateWidget 方法");
  }

  @override
  Widget build(BuildContext context) {
    print("7. 调用_ADStatefulWidgetState的build方法");
    return ADHomeContent();
  }

  // ignore: non_constant_identifier_names
  Widget ADHomeContent() {
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
  /// 当State对象从树中被移除时，会调用此回调。
  void deactivate() {
    super.deactivate();
    print("8. 调用_ADStatefulWidgetState的deactivate方法");
  }

  @override
  /// 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
  void dispose() {
    super.dispose();
    print("9. 调用_ADStatefulWidgetState的dispose方法");
  }
}
