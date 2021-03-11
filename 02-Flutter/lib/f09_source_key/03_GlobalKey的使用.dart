import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<_ADHomeContentState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.gesture),
          onPressed: () {
            print(globalKey.currentState.message);
            print(globalKey.currentState.widget.name);
            globalKey.currentState.test();
          },
        ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: ADHomeContent(
          key: globalKey,
        ),
      ),
    );
  }
}

class ADHomeContent extends StatefulWidget {
  final String name = "123";

  ADHomeContent({Key key}) : super(key: key);

  @override
  _ADHomeContentState createState() => _ADHomeContentState();
}

class _ADHomeContentState extends State<ADHomeContent> {
  final String message = "abc";
  final bool isShow = false;

  void test() {
    print("testtesttest");
  }

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
