import 'package:covid_alert/shared/themes/theme_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'screens/home/controllers/home_controller.dart';
import 'screens/home/home_screen.dart';
import 'screens/new_denuncia/controllers/new_denuncia_controller.dart';

void main() {
  GetIt.I.registerSingleton<HomeController>(HomeController());
  GetIt.I.registerSingleton<NewDenunciaController>(NewDenunciaController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('pt', "BR"),
        ],
        home: HomeScreen(),
        theme: themeDefault(),
      ),
    );
  }
}
