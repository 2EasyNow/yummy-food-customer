import 'package:flutter/material.dart';
import 'colors/colors.dart';
import 'text_theme.dart';
import 'theme_data.dart';

var _colors = DarkThemeColors();
ThemeData _themeData = CustomTheme.create(_colors, Brightness.dark);

ThemeData darkTheme = _themeData.copyWith(
  textTheme: _themeData.textTheme.copyWith(
    subtitle1: AppTextStyle(
      color: _colors.grey50,
    ),
  ),
  inputDecorationTheme: _themeData.inputDecorationTheme.copyWith(
    filled: true,
    fillColor: _colors.grey900,
    iconColor: _colors.grey400,
    hintStyle: AppTextStyle(
      color: _colors.grey400,
    ),
  ),
  navigationBarTheme: _themeData.navigationBarTheme.copyWith(
    backgroundColor: const Color.fromRGBO(15, 15, 15, 1),
    indicatorColor: _colors.primary,
    elevation: 0.0,
  ),
);
