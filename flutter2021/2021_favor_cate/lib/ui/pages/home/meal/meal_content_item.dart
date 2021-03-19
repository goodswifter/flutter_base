import 'package:favor_cate/core/model/meal_model.dart';
import 'package:favor_cate/core/viewmodel/favor_view_model.dart';
import 'package:favor_cate/ui/pages/home/detail/detail_page.dart';
import 'package:favor_cate/ui/pages/home/meal/meal_content_operation_item.dart';
import 'package:flutter/material.dart';
import 'package:favor_cate/core/extension/int_extension.dart';
import 'package:provider/provider.dart';

final cardRadius = 12.px;

class ADHomeMealContentItem extends StatelessWidget {
  final ADMealModel _meal;

  ADHomeMealContentItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ADHomeDetailPage.routeName,
          arguments: _meal,
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.px),
        elevation: 5.px,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: [
            itemBasicInfo(context),
            itemOperationInfo(),
          ],
        ),
      ),
    );
  }

  Widget itemBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius),
          ),
          child: FadeInImage.assetNetwork(
            image: _meal.imageUrl,
            placeholder: "assets/image/logo.png",
            fadeInDuration: Duration(milliseconds: 100),
            fadeOutDuration: Duration(milliseconds: 100),
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10.px,
          bottom: 5.px,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.px),
            ),
            child: Text(
              _meal.title,
              style: Theme.of(context).textTheme.headline2.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget itemOperationInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ADMealOperationItem(Icon(Icons.schedule), "${_meal.duration}分钟"),
        ADMealOperationItem(Icon(Icons.restaurant), _meal.complexityStr),
        buildFavorItem(),
      ],
    );
  }

  Widget buildFavorItem() {
    return Consumer<ADFavorViewModel>(
      builder: (context, favorVM, child) {
        // 1. 判断是否收藏状态
        final iconData =
            favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
        final favorColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;
        final title = favorVM.isFavor(_meal) ? "收藏" : "未收藏";
        return GestureDetector(
          child: ADMealOperationItem(
            Icon(
              iconData,
              color: favorColor,
            ),
            title,
            textColor: favorColor,
          ),
          onTap: () => favorVM.handleMeals(_meal),
        );
      },
    );
  }
}
