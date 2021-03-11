import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ADHomePage(),
    );
  }
}

class ADHomePage extends StatefulWidget {
  @override
  _ADHomePageState createState() => _ADHomePageState();
}

class _ADHomePageState extends State<ADHomePage> {
  final List<String> names = ["aaaa", "bbbb", "cccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("key的案例解析"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (() {
          setState(() {
            names.removeAt(0);
          });
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView(
        children: names.map((item) {
//          return ListItemFul(item, key: ValueKey(item),);
          return ListItemFul(
            item,
            key: UniqueKey(),
          );
        }).toList(),
      ),
    );
  }
}

// 02
class ListItemFul extends StatefulWidget {
  final String name;

  ListItemFul(this.name, {Key key}) : super(key: key);

  @override
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Text(widget.name),
      color: randomColor,
    );
  }
}

// 01
class ListItemLess extends StatelessWidget {
  final String name;
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  ListItemLess(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Text(name),
      color: randomColor,
    );
  }
}
