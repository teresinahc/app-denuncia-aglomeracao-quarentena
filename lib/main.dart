import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'screens/home/controllers/home_controller.dart';
import 'screens/home/home_screen.dart';

void main() {
  GetIt.I.registerSingleton<HomeController>(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(primaryColor: Colors.red, indicatorColor: Colors.red),
    );
  }
}
