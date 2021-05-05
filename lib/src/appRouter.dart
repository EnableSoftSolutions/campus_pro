import 'package:campus_pro/src/UI/PAGES/homePage.dart';
import 'package:campus_pro/src/UI/PAGES/splashScreen.dart';
import 'package:flutter/material.dart';

_page(Widget page) {
  return MaterialPageRoute(builder: (_) => page);
}

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case SplashScreen.routeName:
        return _page(
          SplashScreen(),
        );
        break;
      case HomePage.routeName:
        return _page(
          HomePage(),
        );
        break;
      default:
        return _page(SplashScreen());
        break;
    }
  }
}
