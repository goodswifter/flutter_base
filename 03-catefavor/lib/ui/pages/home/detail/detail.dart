import 'package:catefavor/core/model/meal_model.dart';
import 'package:catefavor/ui/pages/home/detail/detail_content.dart';
import 'package:flutter/material.dart';

import 'detail_float_button.dart';

class ADDetailPage extends StatelessWidget {
  static final String routeName = "/detail";

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