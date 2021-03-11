import 'package:flutter/material.dart';
import 'package:study_flutter/f13_animation/pages/modal_page.dart';

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
          children: <Widget>[
            RaisedButton(
              child: Text("Modal 跳转"),
              onPressed: () {
                // 1. iOS Modal跳转
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) {
                      return ADModalPage();
                    },
                    fullscreenDialog: true
                ));
              },
            ),
            RaisedButton(
              child: Text("自定义动画跳转"),
              onPressed: () {
                // 1. iOS Modal跳转
                Navigator.of(context).push(PageRouteBuilder(
//                  transitionDuration: Duration(seconds: 3),
                    pageBuilder: (ctx, anim1, anim2) {
                      return FadeTransition(
                        opacity: anim1,
                        child: ADModalPage(),
                      );
                    }
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}