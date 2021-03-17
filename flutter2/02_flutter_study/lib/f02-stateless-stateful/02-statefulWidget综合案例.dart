import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: ADHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器"),
      ),
      body: ADHomeBody("你好, 兄dei"),
    );
  }
}

class ADHomeBody extends StatefulWidget {
  final String message;
  ADHomeBody(this.message);
  @override
  _ADHomeBodyState createState() => _ADHomeBodyState();
}

class _ADHomeBodyState extends State<ADHomeBody> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getButtons(),
          Text(
            "当前计数:$_counter",
            style: TextStyle(fontSize: 25),
          ),
          Text("statelessW传递的信息是:${widget.message}")
        ],
      ),
    );
  }

  Widget _getButtons() {
    final addBtnStyle = TextStyle(fontSize: 20, color: Colors.green);
    final minusBtnStyle = TextStyle(fontSize: 20, color: Colors.red);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
            child: Text(
              "+",
              style: addBtnStyle,
            ),
            onPressed: () {
              setState(() {
                _counter++;
              });
            }),
        RaisedButton(
            child: Text("-", style: minusBtnStyle),
            onPressed: () {
              setState(() {
                _counter--;
              });
            }),
      ],
    );
  }
}
