import 'package:flutter/cupertino.dart';
import 'package:i18n_demo02/i18n/localizations_init.dart';

class ADLocalizationsDelegate extends LocalizationsDelegate<ADLocalizations> {
  static ADLocalizationsDelegate delegate = ADLocalizationsDelegate();

  @override
  // 用于当前环境的Locale，是否在我们支持的语言范围
  bool isSupported(Locale locale) {
    final languageCodes = ADLocalizations.supportedLocales.map((loc) => loc.languageCode).toList();
    return languageCodes.contains(locale.languageCode);
  }

  @override
  // 当Locale发生改变时（语言环境），加载对应的HYLocalizations资源
  Future<ADLocalizations> load(Locale locale) async {
    final localization = ADLocalizations(locale);
    await localization.loadi18nJSON();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<ADLocalizations> old) {
    return false;
  }

}