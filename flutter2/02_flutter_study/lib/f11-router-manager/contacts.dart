import 'package:flutter/material.dart';

class ADContactsPage extends StatelessWidget {
  static const String routeName = "/contacts";

  final String contactsMessage;

  ADContactsPage(this.contactsMessage);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _backToHome(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("联系人"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(contactsMessage,
                  style: TextStyle(fontSize: 20, color: Colors.red)),
              ElevatedButton(
                onPressed: () => _backToHome(context),
                child: Text("跳转到首页"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    // 传参返回信息
    Navigator.of(context).pop("反向传递信息: contacts -> home");
  }
}
