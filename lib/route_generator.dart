import 'package:flutter/material.dart';
import 'package:mplussoft/screens/home_screen.dart';
import 'package:mplussoft/screens/splash_screen.dart';

import 'helper/all_screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case '/homeScreen':
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());
      case '/screens':
        return MaterialPageRoute(builder: (_) => Screens());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(body: SizedBox(height: 0)));
    }
  }
}
