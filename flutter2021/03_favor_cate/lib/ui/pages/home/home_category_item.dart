import 'package:favor_cate/core/model/category_model.dart';
import 'package:favor_cate/ui/pages/home/meal/meal_page.dart';
import 'package:flutter/material.dart';
import 'package:favor_cate/core/extension/int_extension.dart';

class ADHomeCategoryItem extends StatelessWidget {
  final ADCategoryModel _category;

  const ADHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    Color bgColor = _category.bgColor;
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.headline2.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.px),
          // 渐变
          gradient: LinearGradient(
            colors: [bgColor.withOpacity(0.5), bgColor],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(ADHomeMealPage.routeName, arguments: _category);
      },
    );
  }
}
