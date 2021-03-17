import 'package:flutter/material.dart';
import 'package:flutter_study/f07-network/http_request.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ADHomeBody();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("网路请求")),
        body: ADHomeBody(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ADHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ADHomeContent();
  }
}

class ADHomeContent extends StatefulWidget {
  @override
  _ADHomeContentState createState() => _ADHomeContentState();
}

class _ADHomeContentState extends State<ADHomeContent> {
  @override
  void initState() {
    super.initState();

    Map<String, dynamic> params = Map();
    params["name"] = "zad";
    params["age"] = 18;

    HttpRequest.request("get", params: params).then((value) {
      print(value);
    }).catchError((err) {
      print("=== + ${err.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("Hello World");
  }
}