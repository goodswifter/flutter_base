import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("输入框Widget"),
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
          // 用户名TF
          ADUserNameTF(usernameCtrl),
          SizedBox(
            height: 10,
          ),
          // 密码TF
          ADPasswordTF(passwordCtrl),
          SizedBox(
            height: 10,
          ),
          // 登录按钮
          ADLoginButton(
            usernameCtrl,
            passwordCtrl,
          ),
        ],
      ),
    );
  }
}

class ADLoginButton extends StatelessWidget {
  final TextEditingController usernameCtrl;
  final TextEditingController passwordCtrl;

  // const ADLoginButton({Key key, this.usernameCtrl, this.passwordCtrl})
  // : super(key: key);
  ADLoginButton(this.usernameCtrl, this.passwordCtrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      height: 40,
      child: FlatButton(
        color: Colors.blue,
        onPressed: () {
          // 1. 获取用户名和密码
          final username = usernameCtrl.text;
          final password = passwordCtrl.text;
          print("账号:$username 密码:$password");
          usernameCtrl.text = "";
          passwordCtrl.text = "";
        },
        child: Text(
          "登录",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class ADUserNameTF extends StatelessWidget {
  final TextEditingController usernameCtrl;

  ADUserNameTF(this.usernameCtrl);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: usernameCtrl,
      decoration: InputDecoration(
        labelText: "username",
        icon: Icon(Icons.person),
        hintText: "请输入用户名",
        filled: true,
        fillColor: Colors.red[100],
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => print("onChanged: $value"),
      onSubmitted: (value) => print("onSubmitted: $value"),
    );
  }
}

class ADPasswordTF extends StatelessWidget {
  final TextEditingController passwordCtrl;

  ADPasswordTF(this.passwordCtrl);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordCtrl,
      decoration: InputDecoration(
        labelText: "password",
        icon: Icon(Icons.lock),
        hintText: "请输入密码",
        filled: true,
        fillColor: Colors.red[100],
        border: UnderlineInputBorder(),
      ),
      onChanged: (value) => print("onChanged: $value"),
      onSubmitted: (value) => print("onSubmitted: $value"),
    );
  }
}
