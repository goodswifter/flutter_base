import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("手势检测"),
      ),
      body: ADHomePage(),
    ));
  }
}

class ADHomePage extends StatefulWidget {
  @override
  _ADHomePageState createState() => _ADHomePageState();
}

class _ADHomePageState extends State<ADHomePage>
    with SingleTickerProviderStateMixin {
  double topDistance = 0.0;
  double leftDistance = 0.0;
  double radius = 100;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double statusHeight = MediaQueryData.fromWindow(window).padding.top;

    leftDistance = size.width * 0.5 - radius;
    topDistance =
        (size.height - statusHeight - kMinInteractiveDimension) * 0.5 - radius;
    print(
        "$leftDistance, $topDistance, $statusHeight, $kMinInteractiveDimension, $size");
    return Stack(
      children: [ADCircleText(leftDistance, topDistance, radius)],
    );
  }
}

class ADCircleText extends StatefulWidget {
  final double left;
  final double top;
  final double radius;

  ADCircleText(this.left, this.top, this.radius);

  @override
  _ADCircleTextState createState() => _ADCircleTextState();
}

class _ADCircleTextState extends State<ADCircleText>
    with SingleTickerProviderStateMixin {
  double left;
  double top;
  double startY;
  double beginRadius;
  double endRadius;
  bool isStartDarg = false;
  bool isBackOrigin = false;
  // double deltaRadiusValue; // deltaRadiusValue
  // 1. 创建动画控制器
  AnimationController _controller;
  // 2. 创建值范围的动画对象
  Animation _tweenAnim;

  @override
  void initState() {
    super.initState();

    left = widget.left;
    top = widget.top;
    beginRadius = widget.radius;
    endRadius = widget.radius;

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _tweenAnim = Tween(begin: endRadius, end: beginRadius).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _tweenAnim,
      builder: (ctx, child) {
        RelativeRect beginRect = RelativeRect.fromSize(
            Rect.fromLTWH(left, top, 2 * beginRadius, 2 * beginRadius),
            Size(2 * beginRadius, 2 * beginRadius));
        RelativeRect endRect = RelativeRect.fromSize(
            Rect.fromLTWH(0, 0, 2 * beginRadius, 2 * beginRadius),
            Size(2 * beginRadius, 2 * beginRadius));
        return PositionedTransition(
          rect: RelativeRectTween(
            begin: beginRect,
            end: endRect,
          ).animate(_tweenAnim),
          child: Positioned(
            left: left,
            top: top,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
                radius: endRadius,
              ),
              onPanStart: (details) {
                startY = details.localPosition.dy;
              },
              onPanUpdate: (DragUpdateDetails details) {
                double deltaY = details.localPosition.dy - startY;
                if (deltaY > 50) {
                  isStartDarg = true;
                  isBackOrigin = false;
                } else {
                  isBackOrigin = true;
                }
                if (isStartDarg) {
                  setState(() {
                    endRadius =
                        deltaY > 0 ? beginRadius - deltaY / 10 : beginRadius;
                    print("endRadius: $endRadius");
                    left += details.delta.dx;
                    top += details.delta.dy;
                  });
                }
              },
              onPanEnd: (details) {
                if (isBackOrigin) {
                  setState(() {
                    left = widget.left;
                    top = widget.top;
                    _controller.forward();
                  });
                } else {
                  print("返回上一界面");
                }
                isStartDarg = false;
              },
            ),
          ),
        );
      },
    );
  }
}
