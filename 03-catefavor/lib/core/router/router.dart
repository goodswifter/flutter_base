import 'package:catefavor/ui/pages/home/detail/detail.dart';
import 'package:catefavor/ui/pages/home/drawer/filter/filter.dart';
import 'package:catefavor/ui/pages/main/main.dart';
import 'package:catefavor/ui/pages/home/meal/meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ui/pages/unknown/unknown.dart';

class ADRouter {
  static final Map<String, WidgetBuilder> routes = {
    ADMainPage.routeName: (ctx) => ADMainPage(),
    ADMealPage.routeName: (ctx) => ADMealPage(),
    ADDetailPage.routeName: (ctx) => ADDetailPage(),
  };

  // 初始化路由, 设置了该属性, 就不需要再设置home属性了
  static final String initialRoute = ADMainPage.routeName;

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == ADFilterPage.routeName) {
      return MaterialPageRoute(
        builder: (ctx) => ADFilterPage(),
        fullscreenDialog: true,
      );
    }

    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(
        builder: (ctx) {
          return ADUnknownPage();
        }
    );
  };
}