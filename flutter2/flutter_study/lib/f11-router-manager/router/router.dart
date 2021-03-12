import 'package:flutter/material.dart';
import 'package:flutter_study/f11-router-manager/contacts.dart';

import '../about.dart';
import '../home.dart';
import '../unknown.dart';

class ADRouter {
  static final Map<String, WidgetBuilder> routes = {
    ADHomePage.routeName: (context) => ADHomePage(),
    ADAboutPage.routeName: (context) => ADAboutPage(),
  };

  // 初始化路由, 设置了该属性, 就不需要再设置home属性了
  static final String initialRoute = ADHomePage.routeName;

  // 路由钩子
  // 拦截特殊处理的Page
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == ADContactsPage.routeName) {
      return MaterialPageRoute(
        builder: (ctx) => ADContactsPage(settings.arguments),
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) => ADUnknownPage());
  };
}
