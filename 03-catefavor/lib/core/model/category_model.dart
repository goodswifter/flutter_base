import 'dart:ui';

class ADCategoryModel {
  String id;
  String title;
  String color;
  Color cColor;

  ADCategoryModel({this.id, this.title, this.color});

  ADCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 1. 将color转化成十六进制
    final colorInt = int.parse(color, radix: 16);
    // 2. 加入透明度
    cColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}