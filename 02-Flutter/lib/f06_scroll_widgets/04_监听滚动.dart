import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ADHomeContent();
  }
}

/// 两种方式可以监听
/// 1. controller
///  - 可以设置默认值offset
///  - 监听滚动, 也可以监听滚动的位置
/// 2. NotificationListener
///  - 除了以上功能, 还可以监听开始滚动和结束滚动
class ADHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ControllerDemo();
  }
}

/// 1. 通过controller监听滚动
class ControllerDemo extends StatefulWidget {
  @override
  _ControllerDemoState createState() => _ControllerDemoState();
}

class _ControllerDemoState extends State<ControllerDemo> {
  ScrollController _controller;
  bool _showToTopBtn = false;

  @override
  void initState() {
    super.initState();

    // 初始化ScrollController
    _controller = ScrollController();

    // 添加监听
    _controller.addListener(() {
      setState(() {
        print(_controller.offset); // 打印滚动位置
        setState(() {
          _showToTopBtn = _controller.offset >= 1000;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("滚动监听"),
        ),
        floatingActionButton: _showToTopBtn ? FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
          },
        ) : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: NotificationListener(
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollStartNotification) {
              print("开始滚动");
            } else if (notification is ScrollUpdateNotification) {
              print("正在滚动...,总滚动距离:${notification.metrics.maxScrollExtent} 当前滚动的位置: ${notification.metrics.pixels}");
            } else if (notification is ScrollEndNotification) {
              print("结束滚动");
            }
            return true;
          },
          child: ListView.builder(
              controller: _controller,
              itemCount: 100,
              itemBuilder: (BuildContext ctx, int index) {
                return ListTile(
                  leading: Icon(Icons.people),
                  title: Text("联系人$index"),
                );
              }
          ),
        ),
      ),
    );
  }
}