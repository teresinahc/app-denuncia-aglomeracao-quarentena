import 'package:covid_alert/screens/splash/splash_screen.dart';
import 'package:covid_alert/shared/service/repository.dart';
import 'package:covid_alert/shared/themes/theme_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'screens/home/controllers/home_controller.dart';
import 'screens/new_denuncia/controllers/new_denuncia_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    GetIt.I.registerSingleton<Repository>(Repository());
    GetIt.I.registerSingleton<HomeController>(HomeController());
    GetIt.I.registerSingleton<NewDenunciaController>(NewDenunciaController());
    super.initState();
  }

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
        home: SplashScreen(),
        theme: themeDefault(),
      ),
    );
  }
}
