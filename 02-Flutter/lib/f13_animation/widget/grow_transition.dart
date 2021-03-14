import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    print("ADGrowTransition - build");
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Container(
              color: Colors.orange,
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: child),
    );
  }
}
