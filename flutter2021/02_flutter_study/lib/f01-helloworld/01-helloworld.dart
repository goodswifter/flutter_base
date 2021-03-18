import 'package:flutter/material.dart';

main() => runApp(MyApp());
// main(List<String> args) {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("goodswifer"),
          ),
          body: ADHomebody(),
        ),
      ),
    );
  }
}

class ADHomebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: true,
              onChanged: (value) => print("Hello World"),
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
