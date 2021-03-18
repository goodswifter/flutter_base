import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_demo/generated/l10n.dart';

void main() => runApp(MyApp());

/// 初始化
/// 1. iOS需要单独设置info.plist
/// 2. 开发国际化最好使用Android Studio的插件开发
///
/// 删除字段和新增字段怎么处理

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ADI18nPage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate, // 指定默认的文本排列方向, 由左到右或由右到左
        S.delegate, // 自定义国际化代理
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

class ADI18nPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).good),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).hello,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );
              },
              child: Text(
                S.of(context).pickTime,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
