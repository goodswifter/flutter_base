import 'package:flutter/material.dart';
import 'package:flutter_study/f11-router-manager/about.dart';
import 'package:flutter_study/f11-router-manager/contacts.dart';
import 'package:flutter_study/f11-router-manager/detail.dart';

class ADHomePage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _ADHomePageState createState() => _ADHomePageState();
}

class _ADHomePageState extends State<ADHomePage> {
  String _homeMessage = "home - 首页";

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
            Text(_homeMessage,
                style: TextStyle(fontSize: 20, color: Colors.red)),
            ElevatedButton(
                onPressed: () => _jumpToDetail(context), child: Text("跳转到详情")),
            ElevatedButton(
                onPressed: () => _jumpToAbout(context), child: Text("跳转到关于")),
            ElevatedButton(
                onPressed: () => _jumpToContacts(context),
                child: Text("跳转到联系人")),
            ElevatedButton(
                onPressed: () => _jumpToUnknown(context), child: Text("跳转到未知")),
          ],
        ),
      ),
    );
  }

  // 对象路由
  void _jumpToDetail(BuildContext context) {
    // 1. 不传递参数
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (context) => ADDetailPage()),
    // );

    // 2. 传递参数: 通过构造器直接传递即可
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => ADDetailPage("正向传递信息: home -> detail"),
    //   ),
    // );

    // 3. 接收参数
    Future detailResult = Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ADDetailPage("正向传递信息: home -> detail"),
      ),
    );
    detailResult.then((value) {
      setState(() {
        _homeMessage = value;
      });
    });
  }

  // 命名路由
  void _jumpToAbout(BuildContext context) {
    // 1. 不传参
    // Navigator.of(context).pushNamed(ADAboutPage.routeName);

    // 2. 传参
    // Navigator.of(context).pushNamed(
    //   ADAboutPage.routeName,
    //   arguments: "正向传递: home -> about",
    // );

    // 3. 接收参数
    Future aboutResult = Navigator.of(context).pushNamed(
      ADAboutPage.routeName,
      arguments: "正向传递: home -> about",
    );
    aboutResult.then((value) {
      print(value);
      setState(() {
        _homeMessage = value;
      });
    });
  }

  // 命名路由: 路由钩子
  void _jumpToContacts(BuildContext context) {
    // 接收参数
    Future aboutResult = Navigator.of(context).pushNamed(
      ADContactsPage.routeName,
      arguments: "正向传递: home -> contacts",
    );
    aboutResult.then((value) {
      print(value);
      setState(() {
        _homeMessage = value;
      });
    });
  }

  // 未知
  void _jumpToUnknown(BuildContext context) {
    Navigator.of(context).pushNamed("/aaaa");
  }
}
