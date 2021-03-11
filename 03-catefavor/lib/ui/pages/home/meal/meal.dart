import 'package:catefavor/core/model/category_model.dart';
import 'package:catefavor/ui/pages/home/meal/meal_content.dart';
import 'package:flutter/material.dart';

class ADMealPage extends StatelessWidget {
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as ADCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ADMealContent(),
    );
  }
}