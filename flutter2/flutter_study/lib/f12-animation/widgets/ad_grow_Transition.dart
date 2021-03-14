import 'package:flutter/material.dart';

class ADGrowTransition extends StatelessWidget {
  ADGrowTransition({this.animation});

  final Animation<double> animation;

  Widget build(BuildContext context) {
    print("ADGrowTransition - build");
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Icon(
            Icons.favorite,
            color: Colors.red,
            size: animation.value,
          );
        },
      ),
    );
  }
}
