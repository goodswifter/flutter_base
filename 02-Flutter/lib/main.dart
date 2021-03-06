import 'package:flutter/material.dart';
import 'package:study_flutter/f15_screen_fit/shared/size_fit.dart';

import 'f05_multiwidgets/03_多子布局Stack.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1. 初始化ADSizeFit类
    ADSizeFit.initialize();

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
    // 2. 手机屏幕的大小(逻辑分辨率)
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final statusHeight = MediaQuery.of(context).padding.top;
    print("屏幕宽高: $width * $height");
    print("状态栏的高度: $statusHeight");
    print(ADSizeFit.screenWidth);

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: StackDemo01(),
      // body: Center(
      //   child: Container(
      //     width: ADSizeFit.setRpx(400),
      //     height: ADSizeFit.setPx(200),
      //     color: Colors.red,
      //     alignment: Alignment.center,
      //     child: Text(
      //       "Hello World",
      //       style: TextStyle(fontSize: 40 * ADSizeFit.rpx),
      //     ),
      //   ),
      // ),
    );
  }
}
