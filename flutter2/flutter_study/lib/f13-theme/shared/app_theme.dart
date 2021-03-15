import 'dart:ui';

import 'package:flutter/material.dart';

class ADAppTheme {
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;

  static final Color normalTextColor = Colors.red;
  static final Color darkTextColor = Colors.green;

  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.yellow,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: normalFontSize,
        color: normalTextColor,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: normalFontSize,
        color: darkTextColor,
      ),
    ),
  );

  static final ButtonThemeData buttonTheme = ButtonThemeData(
    height: 25,
    minWidth: 10,
    buttonColor: Colors.yellow,
  );

  static final CardTheme cardTheme = CardTheme(
    color: Colors.greenAccent, elevation: 10, // 阴影的宽度
  );

  static final TextTheme textTheme = TextTheme(
    headline1: TextStyle(fontSize: 20, color: Colors.red),
    headline2: TextStyle(fontSize: 18, color: Colors.green),
    headline3: TextStyle(fontSize: 16),
    headline4: TextStyle(fontSize: 14),
  );
}
