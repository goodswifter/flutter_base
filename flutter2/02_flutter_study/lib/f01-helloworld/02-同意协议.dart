import 'package:flutter/material.dart';

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("第一个flutter程序"),
        ),
        body: ADHomebody(),
      ),
    );
  }
}

class ADHomebody extends StatefulWidget {
  @override
  _ADHomebodyState createState() => _ADHomebodyState();
}

class _ADHomebodyState extends State<ADHomebody> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: flag,
              onChanged: (value) => this.setState(() {
                flag = value;
              }),
            ),
            Text(
              "同意协议2",
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}