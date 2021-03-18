import 'package:flutter/material.dart';

import 'filter_content.dart';

class ADHomeDrawerFilterPage extends StatelessWidget {
  static const String routeName = "/home_drawer_filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食过滤")
      ),
      body: ADFilterContent(),
    );
  }
}
