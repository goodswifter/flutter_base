import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double topDistance = 0.0;
  double leftDistance = 0.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // 2. 手机屏幕的大小(逻辑分辨率)
    final width = size.width;
    final height = size.height;
    // final statusHeight = MediaQuery.of(context).padding.top;
    print("屏幕宽高: $width * $height");
    // print("状态栏的高度: $statusHeight");
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("手势检测"),
            ),
            body: Stack(
              children: <Widget>[
                Positioned(
                  top: topDistance,
                  left: leftDistance,
                  child: GestureDetector(
                    child: CircleAvatar(
                      child: Text("A"),
                    ),
                    onPanDown: (DragDownDetails e) {
                      //打印手指按下的位置(相对于屏幕)
                      print("用户手指按下：${e.globalPosition}");
                    },

                    // 第一种 垂直方向滑动、拖动
                    /*onVerticalDragUpdate:(DragUpdateDetails e) {
                      // 用户手指滑动时，更新偏移，重新构建
                      setState(() {
                        topDistance += e.delta.dy;
                      });
                    },*/

                    // 第二种 水平方向滑动、拖动
                    // onHorizontalDragUpdate: (DragUpdateDetails e) {
                    //   // 用户手指滑动时，更新偏移，重新构建
                    //   setState(() {
                    //     leftDistance += e.delta.dx;
                    //   });
                    // },

                    // 第三种 全方向滑动、拖动
                    // 第三种 手指滑动时会触发此回调
                    onPanUpdate: (DragUpdateDetails e) {
                      //用户手指滑动时，更新偏移，重新构建
                      setState(() {
                        leftDistance += e.delta.dx;
                        topDistance += e.delta.dy;
                      });
                    },

                    //第三种 滑动结束触发此回调
                    onPanEnd: (DragEndDetails e) {
                      //打印滑动结束时在x、y轴上的速度
                      print(e.velocity);
                    },
                  ),
                )
              ],
            )));
  }
}
