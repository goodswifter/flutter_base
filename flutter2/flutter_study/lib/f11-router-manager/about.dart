import 'package:flutter/material.dart';

class ADAboutPage extends StatelessWidget {
  static const String routeName = "/about";

  @override
  Widget build(BuildContext context) {
    // 接受命名路由传递的参数
    final String message = ModalRoute.of(context).settings.arguments;

    return WillPopScope(
      onWillPop: () {
        _backToHome(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("关于"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message, style: TextStyle(fontSize: 20, color: Colors.red)),
              ElevatedButton(
                onPressed: () => _backToHome(context),
                child: Text("跳转到首页"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    // 传参返回信息
    Navigator.of(context).pop("反向传递信息: about -> home");
  }
}
