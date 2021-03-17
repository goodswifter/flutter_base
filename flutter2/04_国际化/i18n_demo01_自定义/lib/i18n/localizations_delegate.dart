import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'localizations_init.dart';

class ADLocalizationsDelegate extends LocalizationsDelegate<ADLocalizations> {
  static ADLocalizationsDelegate delegate = ADLocalizationsDelegate();

  @override
  // 用于当前环境的Locale，是否在我们支持的语言范围
  bool isSupported(Locale locale) {
    final languageCodes = ADLocalizations.supportedLocales
        .map((loc) => loc.languageCode)
        .toList();
    return languageCodes.contains(locale.languageCode);
  }

  @override
  // 当Locale发生改变时(语言环境), 加载对应的ADLocalizations资源
  Future<ADLocalizations> load(Locale locale) {
    return SynchronousFuture(ADLocalizations(locale));
  }

  @override
  // 重新加载数据时, 是否重新加载国际化文件, 一般不需要
  bool shouldReload(LocalizationsDelegate<ADLocalizations> old) {
    return false;
  }
}
