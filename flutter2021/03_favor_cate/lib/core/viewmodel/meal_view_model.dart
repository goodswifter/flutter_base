import 'dart:core';
import 'package:favor_cate/core/services/meal_request.dart';
import 'package:favor_cate/core/viewmodel/base_meal_view_model.dart';

class ADMealViewModel extends ADBaseMealViewModel {
  ADMealViewModel() {
    ADMealRequest.getMealData().then((value) {
      meals = value;
    });
  }
}
