import 'package:favor_cate/core/model/category_model.dart';
import 'package:favor_cate/core/services/json_parse.dart';
import 'package:favor_cate/ui/pages/home/home_category_item.dart';
import 'package:flutter/material.dart';
import 'package:favor_cate/core/extension/int_extension.dart';

class ADHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JSONParse.getCategoryData(),
      builder: (context, snapshot) {
        // snapshot: 快照, 是否有数据展示
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );

        // 请求失败时
        if (snapshot.error != null)
          return Center(
            child: Text("请求失败"),
          );

        final categories = snapshot.data as List<ADCategoryModel>;
        return GridView.builder(
          padding: EdgeInsets.all(15.px),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.px,
            mainAxisSpacing: 8.px,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (ctx, index) {
            return ADHomeCategoryItem(categories[index]);
          },
        );
      },
    );
  }
}
