import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

AnimationController controller;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter 测试")),
        body: ADHomePage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => controller.forward(),
        ),
      ),
    );
  }
}

class ADHomePage extends StatefulWidget {
  @override
  _ADHomePageState createState() => _ADHomePageState();
}

class _ADHomePageState extends State<ADHomePage> {
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
    return ADHomeContent(leftDistance, topDistance, radius);
  }
}

class ADHomeContent extends StatefulWidget {
  final double left;
  final double top;
  final double radius;

  ADHomeContent(this.left, this.top, this.radius);
  @override
  _ADHomeContentState createState() => _ADHomeContentState();
}

class _ADHomeContentState extends State<ADHomeContent>
    with TickerProviderStateMixin {
  double left;
  double top;
  double startY;
  double beginRadius;
  double endRadius;
  bool isStartDrag = false;
  bool isBackOrigin = false;
  Animation<Offset> animation;

  Offset lastLocation = Offset.zero;
  Offset originLocation = Offset.zero;
  double lastDx = 0;
  double lastDy = 0;
  double deltaDx = 0;
  double deltaDy = 0;
  double originDx = 0;
  double originDy = 0;

  @override
  void initState() {
    super.initState();
    left = widget.left;
    top = widget.top;
    beginRadius = widget.radius;
    endRadius = widget.radius;
    originDx = left + beginRadius;
    originDy = top + beginRadius;
    originLocation = Offset(originDx, originDy);

    print("原点位置: ($originDx, $originDy)");

    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: Offset.zero, end: Offset(lastDx, lastDy))
        .animate(controller);
  }

  @override
  void dispose() {
    print("dispose");
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: left,
          top: top,
          child: SlideTransition(
            position: animation,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("$endRadius"),
                radius: 100,
              ),
              onPanStart: (details) {
                print("O2: ${details.globalPosition}");
                startY = details.localPosition.dy;
                deltaDx = details.globalPosition.dx - originDx;
                deltaDy = details.globalPosition.dy - originDy;
                // left = widget.left;
                // top = widget.top;
                print("====$left $top");
              },
              onPanUpdate: (DragUpdateDetails details) {
                double deltaY = details.localPosition.dy - startY;
                if (deltaY > 10) {
                  isStartDrag = true;
                  isBackOrigin = false;
                } else {
                  isBackOrigin = true;
                }
                if (isStartDrag) {
                  setState(() {
                    endRadius =
                        deltaY > 0 ? beginRadius - deltaY / 10 : beginRadius;
                    left += details.delta.dx;
                    top += details.delta.dy;
                    lastLocation = details.globalPosition;
                    print("333-" + "$lastLocation");
                  });
                }
              },
              onPanEnd: (details) {
                if (lastLocation != originLocation && isStartDrag) {
                  print("l2: $lastLocation");
                  double eDx = lastLocation.dx - deltaDx;
                  double eDy = lastLocation.dy - deltaDy;
                  double oDx = originLocation.dx;
                  double oDy = originLocation.dy;
                  setState(() {
                    lastDx = (oDx - eDx) / 200;
                    lastDy = (oDy - eDy) / 200;
                    print(
                        "-----o1:($oDx, $oDy) l1:($eDx, $eDy), offset($lastDx, $lastDy)");
                    controller = AnimationController(
                        duration: Duration(seconds: 2), vsync: this);
                    animation = Tween(
                      begin: Offset(0.0, 0.0),
                      end: Offset(lastDx, lastDy),
                    ).animate(controller);
                    controller.forward();
                  });
                }
                controller.addListener(() {
                  if (controller.status == AnimationStatus.completed) {
                    left = widget.left;
                    top = widget.top;
                  }
                });
                isStartDrag = false;
              },
            ),
          ),
        ),
      ],
    );
  }
}
