import 'dart:math';

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

class _ADHomeContentState extends State<ADHomeContent>
    with SingleTickerProviderStateMixin {
  // 1. 创建动画控制器
  AnimationController _controller;
  // 2. 创建曲线动画对象
  Animation _curvedAnim;
  // 3. 创建值范围的动画对象
  Animation _sizeAnim;
  Animation _colorAnim;
  Animation _opacityAnim;
  Animation _radiansAnim;

  @override
  void initState() {
    super.initState();

    // 设置动画控制器
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    // 设置曲线动画对象
    _curvedAnim = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 设置值范围的动画对象
    // 3.Tween
    // 3.1.创建size的tween
    _sizeAnim = Tween(begin: 50.0, end: 200.0).animate(_controller);
    // 3.2.创建color的tween
    _colorAnim = ColorTween(begin: Colors.orange, end: Colors.purple)
        .animate(_controller);
    // 3.3.创建opacity的tween
    _opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);
    // 3.4.创建radians的tween
    _radiansAnim = Tween(begin: 0.0, end: 2 * pi).animate(_controller);

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
    print("执行_HYHomePageState的build方法");
    return Scaffold(
      appBar: AppBar(
        title: Text("交织动画"),
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
        /**
         * 1. 大小变化动画
         * 2. 颜色变化动画
         * 3. 透明度变化动画
         * 4. 形变: 旋转
         */
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            return Opacity(
              opacity: _opacityAnim.value,
              child: Transform(
                transform: Matrix4.rotationZ(_radiansAnim.value),
                alignment: Alignment.center,
                child: Container(
                  width: _sizeAnim.value,
                  height: _sizeAnim.value,
                  color: _colorAnim.value,
                ),
              ),
            );
          },
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
