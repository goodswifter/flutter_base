import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form表单Widget"),
        ),
        body: ADLoginPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ADLoginPage extends StatelessWidget {
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          FormWidget(),
        ],
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

/// Form表单中输入框必须是FormField类型的
class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration:
                InputDecoration(icon: Icon(Icons.people), labelText: "用户名或手机号"),
            onSaved: (value) => print("用户名: $value"),
          ),
          TextFormField(
            obscureText: true,
            decoration:
                InputDecoration(icon: Icon(Icons.lock), labelText: "密码"),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 44,
            child: RaisedButton(
              color: Colors.lightGreen,
              child: Text(
                "注 册",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                print("点击了注册按钮");
              },
            ),
          ),
        ],
      ),
    );
  }
}
