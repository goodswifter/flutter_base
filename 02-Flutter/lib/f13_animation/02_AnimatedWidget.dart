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

class _ADHomeContentState extends State<ADHomeContent> with SingleTickerProviderStateMixin {
  // 1. 创建动画控制器
  AnimationController _controller;
  // 2. 创建曲线动画对象
  Animation _curvedAnim;
  // 3. 创建值范围的动画对象
  Animation _tweenAnim;

  @override
  void initState() {
    super.initState();

    // 设置动画控制器
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2)
    );

    // 设置曲线动画对象
    _curvedAnim = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 设置值范围的动画对象
    _tweenAnim = Tween(begin: 50.0, end: 150.0).animate(_curvedAnim);

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
        title: Text("动画-AnimatedWidget"),
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
        child: ADAnimationIcon(_tweenAnim),
      ),
    );
  }
}

class ADAnimationIcon extends AnimatedWidget {
//  final Animation _tweenAnim;
  ADAnimationIcon(Animation tweenAnim): super(listenable: tweenAnim);

  @override
  Widget build(BuildContext context) {
    Animation anim = listenable;
    return Icon(Icons.favorite, color: Colors.red, size: anim.value,);
  }
}