import 'dart:convert';

import 'package:catefavor/core/model/category_model.dart';
import 'package:flutter/services.dart';

class JSONParse {
  static Future<List<ADCategoryModel>> getCategoriesData() async {
    // 1. 加载JSON文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2. 将 jsonString 转成 Map/List
    final result = json.decode(jsonString);

    // 3. Map -> Model
    final resultList = result["category"];
    List<ADCategoryModel> modelList = [];
    for (var json in resultList) {
      modelList.add(ADCategoryModel.fromJson(json));
    }

    return modelList;
  }
}