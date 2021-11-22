import 'package:flutter/material.dart';

import '../../main.dart';

// STATIC ROUTE NAMES
const String initialRoute = '/';


// TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING
class RouteGenerator {
  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    late dynamic args;
    if(settings.arguments != null){
      args = settings.arguments as Map;
    }
    switch (settings.name) {
      case initialRoute:
        return _getPageRoute(const MyApp());

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