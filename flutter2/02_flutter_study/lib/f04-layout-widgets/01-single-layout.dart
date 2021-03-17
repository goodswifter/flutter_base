import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
        ),
        body: ADLoginPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ADLoginPage extends StatelessWidget {
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          // Align
          AlignWidget(),
          SizedBox(
            height: 30,
          ),
          PaddingWidget(),
          SizedBox(
            height: 30,
          ),
          ContainerWidget(),
        ],
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//          color: Colors.red,
      width: 200,
      height: 200,
      alignment: Alignment.center,
      child: Text("Hello World"),
//          transform: Matrix4.rotationZ(145),
      decoration: BoxDecoration(
          // decoration的color和Container的color不能同时设置
          color: Colors.green,
          border: Border.all(width: 5, color: Colors.red),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.orange,
                offset: Offset(10, 10),
                spreadRadius: 5,
                blurRadius: 10),
            BoxShadow(
                color: Colors.lightBlueAccent,
                offset: Offset(-10, -10),
                spreadRadius: 5,
                blurRadius: 10),
          ]),
    );
  }
}

class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "你好啊,李银河",
            style: TextStyle(fontSize: 30, backgroundColor: Colors.red),
          ),
        ),
        Container(
          color: Colors.green,
          child: Text(
            "你好啊, Flutter",
            style: TextStyle(fontSize: 30, backgroundColor: Colors.red),
          ),
        ),
      ],
    );
  }
}

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Align(
        // (x, y), 单位1 分别代表长/宽的一半
        alignment: Alignment(-0.5, 2),
        widthFactor: 5, // 子类尺寸宽度的五倍
        heightFactor: 2, // 子类尺寸高度的两倍
        child: Icon(
          Icons.pets,
          size: 50,
        ),
      ),
    );
  }
}
