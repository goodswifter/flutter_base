import 'package:favor_cate/core/model/category_model.dart';
import 'package:favor_cate/core/model/meal_model.dart';
import 'package:favor_cate/core/viewmodel/meal_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'meal_content_item.dart';

class ADHomeMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ADCategoryModel _category =
        ModalRoute.of(context).settings.arguments as ADCategoryModel;

    return Selector<ADMealViewModel, List<ADMealModel>>(
      selector: (ctx, mealVM) => mealVM.meals
          .where((meal) => meal.categories.contains(_category.id))
          .toList(),
      shouldRebuild: (previous, next) => !listEquals(previous, next),
      builder: (context, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) => ADHomeMealContentItem(meals[index]),
        );
      },
    );
  }
}
