import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/network/providers/api_provider.dart';
import 'package:flutter_defualt_project/data/network/repositories/login_repo.dart';
import 'package:flutter_defualt_project/ui/home/home_screen.dart';
import 'package:flutter_defualt_project/ui/login/login_screen.dart';
import 'package:flutter_defualt_project/ui/splash/splash_screen.dart';
import 'package:flutter_defualt_project/ui/tab_box/tab_box_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String homeScreen = "/home_screen";
  static const String tabBoxScreen = "/tab_box_screen";
  static const String loginScreen = "/login_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) =>  LoginScreen(loginRepo: settings.arguments as LoginRepo),
        );
      case RouteNames.tabBoxScreen:
        return MaterialPageRoute(
          builder: (context) =>  TabBox(apiProvider: settings.arguments as ApiProvider),
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            Map<String, dynamic> map =
                settings.arguments as Map<String, dynamic>;
            return HomeScreen(
                productRepo: map["productRepo"], categoryRepo: map["categoryRepo"]);
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}
