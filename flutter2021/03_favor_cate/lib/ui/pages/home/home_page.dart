import 'package:favor_cate/ui/pages/home/home_content.dart';
import 'package:flutter/material.dart';

class ADHomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
        leading: Icon(Icons.settings),
      ),
      body: ADHomeContent(),
    );
  }
}
