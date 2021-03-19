import 'package:favor_cate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

import 'filter_view_model.dart';

class ADBaseMealViewModel extends ChangeNotifier {
  List<ADMealModel> _meals = [];

  ADFilterViewModel _filterVM;

  void updateFilterVM(ADFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  List<ADMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      return true;
    }).toList();
  }

  List<ADMealModel> get originalMeals {
    return _meals;
  }

  set meals(List<ADMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}