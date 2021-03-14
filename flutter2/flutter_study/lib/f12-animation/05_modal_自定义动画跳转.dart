import 'package:flutter/material.dart';
import 'package:flutter_study/f12-animation/pages/modal_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: ADHomePage(),
    );
  }
}

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Modal 跳转"),
              onPressed: () => _modalJump(context),
            ),
            ElevatedButton(
              child: Text("自定义动画跳转"),
              onPressed: () => _customJump(context),
            )
          ],
        ),
      ),
    );
  }

  // iOS Modal跳转
  void _modalJump(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return ADModalPage();
        },
        fullscreenDialog: true,
      ),
    );
  }

  // 自定义动画跳转
  void _customJump(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        // transitionDuration: Duration(seconds: 3),
        pageBuilder: (ctx, anim1, anim2) {
          return FadeTransition(
            opacity: anim1,
            child: ADModalPage(),
          );
        },
      ),
    );
  }
}
