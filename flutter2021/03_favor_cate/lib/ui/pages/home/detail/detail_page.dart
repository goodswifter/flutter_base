import 'package:favor_cate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

import 'detail_content.dart';
import 'detail_float_button.dart';

class ADHomeDetailPage extends StatelessWidget {
  static const String routeName = "/home_detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as ADMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: ADDetailContent(meal),
      floatingActionButton: ADDetailFloatingButton(meal),
    );
  }
}