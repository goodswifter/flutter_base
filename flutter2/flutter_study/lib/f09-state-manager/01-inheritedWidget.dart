import 'package:flutter/material.dart';

main() => runApp(MyApp());

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
      body: ADCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ADShowData01(),
              ADShowData02(),
            ],
          ),
        ),
      ),
    );
  }
}

class ADCounterWidget extends InheritedWidget {
  final int counter;

  ADCounterWidget({this.counter, Widget child}) : super(child: child);

  // 3. 找到当前Widget树中最近的ADCounterWidget
  static ADCounterWidget of(BuildContext context) {
    // 沿着Element树, 去找到最近的ADCounterElement, 从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4. 要不要回调State中的didChangeDependencies方法
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class ADShowData01 extends StatefulWidget {
  @override
  _ADShowData01State createState() => _ADShowData01State();
}

class _ADShowData01State extends State<ADShowData01> {
  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    int counter = ADCounterWidget.of(context).counter;
    return Card(
      child: Text(
        "counter: $counter",
        style: TextStyle(fontSize: 30),
      ),
      color: Colors.red,
    );
  }
}

class ADShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = ADCounterWidget.of(context).counter;
    return Card(
      child: Text(
        "counter: $counter",
        style: TextStyle(fontSize: 30),
      ),
      color: Colors.green,
    );
  }
}
