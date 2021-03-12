import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("手势Gesture"),
        ),
        body: Center(
          child: GestureDemo02(),
        ),
      ),
    );
  }
}

class GestureDemo02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GestureDetector(
          onTapDown: (details) {
            print("outer click");
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
            alignment: Alignment.center,
          ),
        ),
        IgnorePointer(
          child: GestureDetector(
            onTapDown: (details) {
              print("inner click");
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}

class GestureDemo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        print("outer click");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.yellow,
        alignment: Alignment.center,
        child: GestureDetector(
          onTapDown: (details) {
            print("inner click");
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}