import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ADHomeContent(),
    );
  }
}

class ADHomeContent extends StatefulWidget {
  @override
  _ADHomeContentState createState() => _ADHomeContentState();
}

/*
  1. Animation: 抽象类
  * 监听动画状态的改变
  * value
  * status

  2. AnimationController继承自Animation
  * 作用: 控制动画的相关执行操作
  * vsync: 同步信号(this -> with SingleTickerProviderStateMixin)
  * forward(): 向前执行动画
  * reverse(): 反转执行动画

  3. CurvedAnimation:
  * 作用: 设置动画执行的速率(速度曲线)

  4. Tween: 设置动画执行的value范围
  * begin: 开始值
  * end: 结束值
 */
class _ADHomeContentState extends State<ADHomeContent>
    with SingleTickerProviderStateMixin {
  // 1. 创建动画控制器
  AnimationController _controller;
  // 2. 创建曲线动画对象
  Animation _curvedAnimation;
  // 3. 创建值范围的动画对象
  Animation _tweenAnimation;

  @override
  void initState() {
    super.initState();

    // 设置动画控制器
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    // 设置曲线动画对象
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 设置值范围的动画对象
    _tweenAnimation = Tween(begin: 50.0, end: 150.0).animate(_curvedAnimation);

    // 监听动画值的变化
    _controller.addListener(() {
      setState(() {});
    });

    // 监听动画状态的变化
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画基础"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
      body: Center(
        child: Icon(
          Icons.favorite,
          color: Colors.red,
          size: _tweenAnimation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 4. 释放控制动画对象
    _controller.dispose();
    super.dispose();
  }
}
