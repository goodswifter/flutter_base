import 'package:favor_cate/core/model/meal_model.dart';
import 'package:favor_cate/core/services/http_request.dart';

class ADMealRequest {
  static Future<List<ADMealModel>> getMealData() async {
    // 1. 发送网络请求
    final url = "/meal";
    final result = await HttpRequest.get(url);

    // 2. json 转 模型
    final mealArray = result["meal"];
    List<ADMealModel> mealModels = [];
    for (var json in mealArray) {
      mealModels.add(ADMealModel.fromJson(json));
    }

    return mealModels;
  }
}
