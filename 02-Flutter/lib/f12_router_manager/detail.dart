import 'package:flutter/material.dart';

class ADDetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  final String _message;

  ADDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // 当返回为true时, 可以自动返回(flutter帮助我们执行返回操作)
      // 当返回为false时, 自行写返回代码
      onWillPop: () {
        print("重写系统返回代码");
        _backToHome(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back_ios),
//          onPressed: () => _backToHome(context),
//        ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_message, style: TextStyle(fontSize: 20),),
              RaisedButton(
                child: Text("回到首页"),
                onPressed: () => _backToHome(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    print("自定义返回");
    Navigator.of(context).pop("a detail message");
  }
}