import 'package:catefavor/core/model/meal_model.dart';
import 'http_request.dart';

class ADMealRequest {
  static Future<List<ADMealModel>> getMealData() async {
    // 1. 发送网络请求
    final url = "/meal";
    final result = await HttpRequest.request(url);

    // 2. JSON 转 model
    final mealArray = result["meal"];
    List<ADMealModel> meals = [];
    for (var json in mealArray) {
      meals.add(ADMealModel.fromJson(json));
    }

    return meals;
  }
}