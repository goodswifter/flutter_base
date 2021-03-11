import 'dart:ui';

import 'package:flutter/material.dart';

class ADAppTheme {
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;
  static const double xlargeFontSize = 28;

  static final Color normalTextColor = Colors.black87;
  static final Color darkTextColor = Colors.green;

  static final ThemeData normalTheme = ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      // 设置背景颜色
      canvasColor: Color.fromRGBO(255, 254, 222, 1),
      textTheme: TextTheme(
        bodyText2: TextStyle(fontSize: normalFontSize, color: normalTextColor),
        headline4: TextStyle(fontSize: smallFontSize, color: normalTextColor),
        headline3: TextStyle(fontSize: normalFontSize, color: normalTextColor),
        headline2: TextStyle(fontSize: largeFontSize, color: normalTextColor, fontWeight: FontWeight.w400),
        headline1: TextStyle(fontSize: xlargeFontSize, color: normalTextColor, fontWeight: FontWeight.w400),
      )
  );

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: normalFontSize, color: darkTextColor)
      )
  );

  static final ButtonThemeData buttonTheme = ButtonThemeData(
      height: 25,
      minWidth: 10,
      buttonColor: Colors.yellow
  );

  static final CardTheme cardTheme = CardTheme(
      color: Colors.greenAccent,
      elevation: 10 // 阴影的宽度
  );

  static final TextTheme textTheme = TextTheme(
    headline1: TextStyle(fontSize: 20, color: Colors.red),
    headline2: TextStyle(fontSize: 18, color: Colors.green),
    headline3: TextStyle(fontSize: 16),
    headline4: TextStyle(fontSize: 14),
  );


}