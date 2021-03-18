import 'dart:convert';

import 'package:favor_cate/core/model/category_model.dart';
import 'package:flutter/services.dart';

/// 获取首页-分类信息
class JSONParse {
  static Future<List<ADCategoryModel>> getCategoryData() async {
    // 1. 加载json文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2. 将 jsonString 转成 Map/List
    final result = json.decode(jsonString);
    final resultList = result["category"];

    // 3. 创建模型数组
    List<ADCategoryModel> models = [];
    for (var category in resultList) {
      models.add(ADCategoryModel.fromJson(category));
    }

    return models;
  }
}
