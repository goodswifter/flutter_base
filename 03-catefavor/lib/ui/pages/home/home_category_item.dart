import 'package:catefavor/core/model/category_model.dart';
import 'package:catefavor/ui/pages/home/meal/meal.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/int_extension.dart';

class ADHomeCategoryItem extends StatelessWidget {
  final ADCategoryModel _category;

  ADHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.cColor;
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.headline2.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.px),
            // 渐变
            gradient: LinearGradient(
                colors: [
                  bgColor.withOpacity(0.5),
                  bgColor
                ]
            )
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(ADMealPage.routeName, arguments: _category);
      },
    );
  }
}