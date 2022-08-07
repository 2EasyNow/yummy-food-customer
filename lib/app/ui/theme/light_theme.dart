import 'package:flutter/material.dart';
import 'text_theme.dart';
import 'theme_data.dart';

import 'colors/light.dart';

var _colors = LightThemeColors();
ThemeData _themeData = CustomTheme.create(_colors, Brightness.light);

ThemeData lightTheme = _themeData.copyWith(
  textTheme: _themeData.textTheme.copyWith(
    subtitle1: AppTextStyle(
      color: _colors.grey900,
    ),
  ),
  inputDecorationTheme: _themeData.inputDecorationTheme.copyWith(
    filled: true,
    fillColor: _colors.grey100,
    iconColor: _colors.grey400,
    hintStyle: AppTextStyle(
      color: _colors.grey400,
    ),
  ),
  navigationBarTheme: _themeData.navigationBarTheme.copyWith(
    backgroundColor: _colors.grey100,
  ),
);
