import 'package:flutter/material.dart';

class ADHomeDrawerPage extends StatelessWidget {
  static const String routeName = "/home_drawer";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
      ),
    );
  }
}
