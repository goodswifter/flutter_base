import 'package:favor_cate/ui/pages/home/detail/detail_page.dart';
import 'package:favor_cate/ui/pages/home/drawer/filter/filter_page.dart';
import 'package:favor_cate/ui/pages/home/meal/meal_page.dart';
import 'package:favor_cate/ui/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import '../../ui/pages/unknown/unknown.dart';

class ADRouter {
  static final Map<String, WidgetBuilder> routes = {
    ADMainPage.routeName: (ctx) => ADMainPage(),
    ADHomeMealPage.routeName: (ctx) => ADHomeMealPage(),
    ADHomeDetailPage.routeName: (ctx) => ADHomeDetailPage(),
    ADHomeDrawerFilterPage.routeName: (ctx) => ADHomeDrawerFilterPage(),
  };

  // 初始化路由, 设置了该属性, 就不需要再设置home属性了
  static final String initialRoute = ADMainPage.routeName;

  static final RouteFactory generateRoute = (settings) {
    // if (settings.name == ADHomeDrawerFilterPage.routeName) {
    //   return MaterialPageRoute(
    //     builder: (ctx) => ADHomeDrawerFilterPage(),
    //     fullscreenDialog: true,
    //   );
    // }

    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return ADUnknownPage();
    });
  };
}
