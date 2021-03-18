import 'package:favor_cate/core/model/category_model.dart';
import 'package:favor_cate/ui/pages/home/home_content.dart';
import 'package:favor_cate/ui/pages/home/meal/meal_content.dart';
import 'package:flutter/material.dart';

class ADHomeMealPage extends StatelessWidget {
  static const String routeName = "/home_meal";

  @override
  Widget build(BuildContext context) {
    ADCategoryModel _category =
        ModalRoute.of(context).settings.arguments as ADCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(_category.title),
      ),
      body: ADHomeMealContent(),
    );
  }
}
