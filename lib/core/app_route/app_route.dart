import 'package:flutter/material.dart';
import 'package:mobitech_task/screens/home_screen/view/home_screen/screen/home_screen.dart';

class AppRoute {

  static const String homeScreen =  "/home_screen";

  static Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    switch(setting.name) {
      case homeScreen: {
        return MaterialPageRoute(builder: (context) => HomeScreen(),);
      }

      default: {
        return MaterialPageRoute(builder: (context) => HomeScreen(),);
      }
    }
  }
}