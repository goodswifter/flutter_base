import 'package:catefavor/core/services/meal_request.dart';
import 'package:catefavor/core/viewmodel/base_meal_view_model.dart';

class ADMealViewModel extends ADBaseMealViewModel {
  ADMealViewModel() {
    ADMealRequest.getMealData().then((value) {
      meals = value;
      notifyListeners();
    });
  }
}