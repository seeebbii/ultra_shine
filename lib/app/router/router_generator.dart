import 'package:flutter/material.dart';
import 'package:ultra_shine/view/authentication/auth_login_screen.dart';
import 'package:ultra_shine/view/authentication/auth_signup_screen.dart';
import 'package:ultra_shine/view/splash/main_splash_screen.dart';

import '../../main.dart';

// STATIC ROUTE NAMES
const String mainSplashScreen = '/main-splash-screen';
const String authLoginScreen = '/login-screen';
const String authSignUpScreen = '/sign-up-screen';

// TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING
class RouteGenerator {
  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    late dynamic args;
    if (settings.arguments != null) {
      args = settings.arguments as Map;
    }
    debugPrint(settings.name);
    switch (settings.name) {
      case mainSplashScreen:
        return _getPageRoute(const MainSplashScreen());

      case authLoginScreen:
        return _getPageRoute(const AuthLoginScreen());

      case authSignUpScreen:
        return _getPageRoute(const AuthSignUpScreen());

      default:
        return _errorRoute();
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}
