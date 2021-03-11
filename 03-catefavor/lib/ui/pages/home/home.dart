import 'package:catefavor/ui/pages/home/home_app_bar.dart';
import 'package:flutter/material.dart';

import 'home_content.dart';

class ADHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ADHomeAppBar(context),
      body: ADHomeContent(),
    );
  }
}
