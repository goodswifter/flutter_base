import 'package:flutter/material.dart';

import 'favor_content.dart';

class ADFavorPage extends StatelessWidget {
  static const String routeName = "/favor";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
      ),
      body: ADFavorContent(),
    );
  }
}
