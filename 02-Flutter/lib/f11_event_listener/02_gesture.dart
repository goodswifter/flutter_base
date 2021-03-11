import 'package:flutter/material.dart';

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
      onTapDown: (detail) {
        print("手势按下: $detail");
        print(detail.globalPosition);
        print(detail.localPosition);
      },
      onTap: () {
        print("手势点击");
      },
      onTapUp: (event) {
        print("指针抬起");
      },
      onDoubleTap: () {
        print("手指双击");
      },
      onLongPress: () {
        print("长按手势");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.orange,
      ),
    );
  }
}