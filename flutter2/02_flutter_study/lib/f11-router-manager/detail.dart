import 'package:flutter/material.dart';

class ADDetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  final String _detailMessage;

  ADDetailPage(this._detailMessage);

  @override
  Widget build(BuildContext context) {
    // 监听系统返回按钮(方法二)
    return WillPopScope(
      onWillPop: () {
        print("重写系统返回代码");
        _backToHome(context);
        // 当返回为true时, 可以自动返回(flutter帮助我们执行返回操作)
        // 当返回为false时, 自行写返回代码
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情"),
          // 自定义返回按钮(方法一)
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios),
          //   onPressed: () => _backToHome(context),
          // ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_detailMessage,
                  style: TextStyle(fontSize: 20, color: Colors.red)),
              ElevatedButton(
                onPressed: () => _backToHome(context),
                child: Text("返回到首页"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    print("自定义返回 - 返回到首页");
    // 不传参返回
    // Navigator.of(context).pop();

    // 传参返回信息
    Navigator.of(context).pop("反向传递信息: detail -> home");
  }
}
