import 'package:catefavor/ui/pages/favor/favor_content.dart';
import 'package:flutter/material.dart';

class ADFavorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ζηζΆθ"),
      ),
      body: ADFavorContent(),
    );
  }
}