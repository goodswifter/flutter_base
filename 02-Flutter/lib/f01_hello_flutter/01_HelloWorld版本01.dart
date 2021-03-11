import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("第一个Flutter应用"),
      ),
      body: ADHomeBody(),
    ),
  ));
}

class ADHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Hello World",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 36, color: Colors.green),
        ),
      ),
    );
  }
}
