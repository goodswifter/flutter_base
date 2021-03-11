import 'package:flutter/material.dart';

class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo({
    Key key,
    this.usernameTextEditingController,
    this.passwordTextEditingController,
  }) : super(key: key);

  final TextEditingController usernameTextEditingController;
  final TextEditingController passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.red,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameTextEditingController,
              decoration: InputDecoration(
                labelText: "usernamne",
                icon: Icon(Icons.person),
                hintText: "请输入用户名",
                filled: true,
                fillColor: Colors.red[100],
                border: InputBorder.none,
              ),
              onChanged: (value) => print("onChanged: $value"),
              onSubmitted: (value) => print("onSubmitted: $value"),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passwordTextEditingController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "password",
                icon: Icon(Icons.lock),
                hintText: "请输入密码",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => print("onChanged: $value"),
              onSubmitted: (value) => print("onSubmitted: $value"),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 40,
              child: FlatButton(
                child: Text("登录", style: TextStyle(fontSize: 20, color: Colors.white),),
                color: Colors.blue,
                onPressed: () {
                  // 1. 获取用户名和密码
                  final username = usernameTextEditingController.text;
                  final password = passwordTextEditingController.text;
                  print("账号:$username 密码:$password");
                  usernameTextEditingController.text = "";
                  passwordTextEditingController.text = "";
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}