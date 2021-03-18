import 'package:favor_cate/core/router/router.dart';
import 'package:favor_cate/ui/shared/app_theme.dart';
import 'package:favor_cate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => ,)
      ],
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化屏幕相关数据
    ADSizeFit.initialize();

    return MaterialApp(
      title: '美食广场',
      // 主题
      theme: ADAppTheme.normalTheme,
      // 路由
      routes: ADRouter.routes,
      initialRoute: ADRouter.initialRoute,
      onGenerateRoute: ADRouter.generateRoute,
      onUnknownRoute: ADRouter.unknownRoute,
      // 去掉debug横幅
      debugShowCheckedModeBanner: false,
    );
  }
}
