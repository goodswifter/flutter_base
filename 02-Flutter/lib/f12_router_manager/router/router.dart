import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home.dart';
import '../detail.dart';
import '../about.dart';
import '../unknown.dart';

class ADRouter {
  static final Map<String, WidgetBuilder> routes = {
    ADHomePage.routeName: (ctx) => ADHomePage(),
    ADAboutPage.routeName: (ctx) => ADAboutPage()
  };

  // 初始化路由, 设置了该属性, 就不需要再设置home属性了
  static final String initialRoute = ADHomePage.routeName;

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == ADDetailPage.routeName) {
      return MaterialPageRoute(
        builder: (ctx) {
          return ADDetailPage(settings.arguments);
        }
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