import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("指针Pointer"),
        ),
        body: Center(
          child: ADPointerWidget(),
        ),
      ),
    );
  }
}

class ADPointerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print("指针按下:$event");
        print(event.position);
        print(event.localPosition);
      },
      onPointerMove: (event) {
        print("指针移动");
      },
      onPointerUp: (event) {
        print("指针抬起");
      },
      onPointerCancel: (event) {
        print("指针取消");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}
