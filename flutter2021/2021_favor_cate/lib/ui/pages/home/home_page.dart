import 'package:favor_cate/ui/pages/home/home_content.dart';
import 'package:flutter/material.dart';

import 'home_app_bar.dart';

class ADHomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ADHomeAppBar(context),
      body: ADHomeContent(),
    );
  }
}
