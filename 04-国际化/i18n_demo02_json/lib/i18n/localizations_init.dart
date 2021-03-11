import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_demo02/i18n/localizations_delegate.dart';

class ADLocalizations {
  final Locale locale;
  ADLocalizations(this.locale);

  static ADLocalizations of(BuildContext context) {
    return Localizations.of(context, ADLocalizations);
  }

  static List<Locale> supportedLocales = [
    Locale("en"),
    Locale("zh"),
  ];

  static List<LocalizationsDelegate> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
    GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
    GlobalWidgetsLocalizations.delegate, // 指定默认的文本排列方向, 由左到右或由右到左
    ADLocalizationsDelegate.delegate, // 自定义文本相关的代理
  ];

  static Map<String, Map<String, String>> _localizationsValues = {};

  Future loadi18nJSON() async {
    // 1. 加载JSON文件
    final jsonString = await rootBundle.loadString("assets/json/i18n.json");

    // 2. 对json进行解析
    Map<String, dynamic> map = json.decode(jsonString);
    _localizationsValues = map.map((key, value) {
      return MapEntry(key, value.cast<String, String>());
    });
  }

  String get title {
    return _localizationsValues[locale.languageCode]["title"];
  }

  String get hello {
    return _localizationsValues[locale.languageCode]["hello"];
  }

  String get pickTime {
    return _localizationsValues[locale.languageCode]["pickTime"];
  }
}