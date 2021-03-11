import 'package:catefavor/core/model/category_model.dart';
import 'package:catefavor/core/model/meal_model.dart';
import 'package:catefavor/core/viewmodel/meal_view_model.dart';
import 'package:catefavor/ui/pages/home/meal/meal_content_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class ADMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ADMealContentSelector();
  }
}

class ADMealContentSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context).settings.arguments as ADCategoryModel;
    return Selector<ADMealViewModel, List<ADMealModel>>(
      selector: (ctx, mealVM) => mealVM.meals
          .where((meal) => meal.categories.contains(category.id))
          .toList(),
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (ctx, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return ADMealContentItem(meals[index]);
          },
        );
      },
    );
  }
}

//class ADMealContentConsumer extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final category = ModalRoute.of(context).settings.arguments as ADCategoryModel;
//    return Consumer<ADMealViewModel>(
//      builder: (ctx, mealVM, child) {
//        final meals = mealVM.meals.where((meal) => meal.categories.contains(category.id)).toList();
//        return ListView.builder(
//          itemCount: meals.length,
//          itemBuilder: (ctx, index) {
//            return ListTile(title: Text(meals[index].title),);
//          }
//        );
//      },
//    );
//  }
//}
