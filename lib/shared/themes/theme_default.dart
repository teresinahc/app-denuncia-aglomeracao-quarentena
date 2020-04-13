import 'package:flutter/material.dart';

themeDefault() {
  return ThemeData(
      accentColor: Colors.red,
      primarySwatch: Colors.red,
      primaryColor: Colors.red,
      indicatorColor: Colors.red,
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary));
}
