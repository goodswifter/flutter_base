import 'package:flutter/material.dart';

class ADUnknownPage extends StatelessWidget {
  static const String routeName = "/unknown";

  final String _homeMessage = "unknown - 未知";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("未知"),
      ),
      body: Center(
        child: Text(
          _homeMessage,
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
