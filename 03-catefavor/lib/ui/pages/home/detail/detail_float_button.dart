import 'package:catefavor/core/model/meal_model.dart';
import 'package:catefavor/core/viewmodel/favor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ADDetailFloatingButton extends StatelessWidget {
  final ADMealModel _meal;
  ADDetailFloatingButton(this._meal);

  @override
  Widget build(BuildContext context) {
    return Consumer<ADFavorViewModel>(
      builder: (ctx, favorVM, child) {
        // 1. 判断是否是收藏状态
        final iconData = favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
        final iconColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;

        return FloatingActionButton(
          child: Icon(iconData, color: iconColor,),
          onPressed: () => favorVM.handleMeals(_meal),
        );
      },
    );
  }
}
