import 'package:flutter/material.dart';

themeDefault() {
  return ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
      }),
      accentColor: Colors.red,
      primarySwatch: Colors.red,
      primaryColor: Colors.red,
      indicatorColor: Colors.red,
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary));
}
