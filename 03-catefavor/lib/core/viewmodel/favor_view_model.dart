import 'package:catefavor/core/model/meal_model.dart';
import 'package:catefavor/core/viewmodel/base_meal_view_model.dart';

class ADFavorViewModel extends ADBaseMealViewModel {
  void addMeals(ADMealModel meal) {
    // 为什么不用meals, 应为meals是新生成的对象, 对他操作没有作用
//    meals.add(meal);
    originalMeals.add(meal);
    notifyListeners();
  }

  void removeMeals(ADMealModel meal) {
    originalMeals.remove(meal);
    notifyListeners();
  }

  void handleMeals(ADMealModel meal) {
    if (isFavor(meal)) {
      removeMeals(meal);
    } else {
      addMeals(meal);
    }
  }

  bool isFavor(ADMealModel meal) {
    return originalMeals.contains(meal);
  }
}