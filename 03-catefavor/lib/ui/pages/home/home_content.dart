import 'package:catefavor/core/model/category_model.dart';
import 'package:catefavor/core/services/json_parse.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/int_extension.dart';
import 'home_category_item.dart';

class ADHomeContent extends StatefulWidget {
  @override
  _ADHomeContentState createState() => _ADHomeContentState();
}

class _ADHomeContentState extends State<ADHomeContent> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JSONParse.getCategoriesData(),
      // snapshot: 快照, 是否有数据展示
      builder: (ctx, snapshot) {
        // 没有数据时
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        // 请求失败时
        if (snapshot.error != null) return Center(child: Text("请求失败"),);

        final categories = snapshot.data;
        return GridView.builder(
            padding: EdgeInsets.all(15.px),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.px,
                mainAxisSpacing: 8.px,
                childAspectRatio: 1.5
            ),
            itemBuilder: (ctx, index) {
              return ADHomeCategoryItem(categories[index]);
            }
        );
      },
    );
  }
}

/// 通过FutureBuilder创建列表

/// 通过GridView创建列表
/// List<ADCategoryModel> _categories = [];
///   @override
//  void initState() {
//    super.initState();
//
//    // 获取数据
//    JSONParse.getCategoriesData().then((value) {
//      setState(() => _categories = value);
//    });
//  }
class ADGridViewWidget extends StatelessWidget {
  const ADGridViewWidget({
    Key key,
    @required List<ADCategoryModel> categeries,
  }) : _categories = categeries, super(key: key);

  final List<ADCategoryModel> _categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(15.px),
      itemCount: _categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.px,
        mainAxisSpacing: 8.px,
        childAspectRatio: 1.5
      ),
      itemBuilder: (ctx, index) {
        return ADHomeCategoryItem(_categories[index]);
      }
    );
  }
}