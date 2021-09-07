import 'package:flippy/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  accentColor: Styles.colorAccent,
  primaryColor: Styles.colorPrimary,
  fontFamily: Styles.fontLato,
  scaffoldBackgroundColor: Styles.colorBackground,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Styles.colorPrimary,
    ),
  ),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false, // 1
    systemOverlayStyle: SystemUiOverlayStyle.light, // 2
    backgroundColor: Styles.colorPrimary,
  ),
  tabBarTheme: TabBarTheme(),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: Styles.fontLato,
);
