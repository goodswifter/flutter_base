import 'package:favor_cate/core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:favor_cate/core/extension/int_extension.dart';

class ADDetailContent extends StatelessWidget {
  final ADMealModel _meal;
  ADDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildBannerImage(),
          buildTitleHandle(context, "制作材料"),
          buildMakeMaterial(context),
          buildTitleHandle(context, "制作步骤"),
          buildMakeSteps(context),
          SizedBox(height: 100,)
        ],
      ),
    );
  }

  // 1. 横幅图片
  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: FadeInImage.assetNetwork(
        placeholder: "assets/images/default_food.jpg",
        image: _meal.imageUrl
      ),
    );
  }

  // 2. 制作材料
  Widget buildMakeMaterial(BuildContext context) {
    Widget child = ListView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(), // 物理滚动方式: 从不滚动
        shrinkWrap: true, // 是否收缩包裹
        itemCount: _meal.ingredients.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.px, horizontal: 10.px),
              child: Text(_meal.ingredients[index]),
            ),
          );
        }
    );
    return buildContentHandle(context: context, child: child);
  }

  // 3. 制作步骤
  Widget buildMakeSteps(BuildContext context) {
    Widget child = ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _meal.steps.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          child: Text("#${index + 1}"),
        ),
        title: Text(_meal.steps[index]),
      ),
      separatorBuilder: (ctx, index) => Divider(),
    );
    return buildContentHandle(context: context, child: child);
  }

  // 4. 公共方法
  // 标题处理
  Widget buildTitleHandle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(title, style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.bold),),
    );
  }

  // 内容列表处理
  Widget buildContentHandle({BuildContext context, Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.px),
      ),
      child: child,
      width: MediaQuery.of(context).size.width - 30.px,
    );
  }
}
