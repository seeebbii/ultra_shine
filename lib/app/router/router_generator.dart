import 'package:flutter/material.dart';
import 'package:ultra_shine/view/Home/choose_vehicle_type.dart';
import 'package:ultra_shine/view/authentication/auth_login_screen.dart';
import 'package:ultra_shine/view/home/exterior_screen.dart';
import 'package:ultra_shine/view/home/film_screen.dart';
import 'package:ultra_shine/view/home/interior_screen.dart';
import 'package:ultra_shine/view/home/maintenance_screen.dart';
import 'package:ultra_shine/view/home/paint_protection_screen.dart';
import 'package:ultra_shine/view/home/payment_method_screen.dart';
import 'package:ultra_shine/view/home/product_screen.dart';
import 'package:ultra_shine/view/home/request_screen.dart';
import 'package:ultra_shine/view/splash/main_splash_screen.dart';
import 'package:ultra_shine/view/splash/onboard/onboard_root.dart';
import 'package:ultra_shine/view/splash/onboard/onboard_welcome_1.dart';
import 'package:ultra_shine/view/splash/onboard/onboard_welcome_2.dart';
import 'package:ultra_shine/view/splash/onboard/onboard_welcome_3.dart';

import '../../main.dart';

// STATIC ROUTE NAMES
// SPLASH / ON BOARDING
const String mainSplashScreen = '/main-splash-screen';
const String onBoardRoot = '/on-board-root';
const String onBoardWelcome1 = '/on-board-welcome-1';
const String onBoardWelcome2 = '/on-board-welcome-2';
const String onBoardWelcome3 = '/on-board-welcome-3';

// AUTH
const String authLoginScreen = '/login-screen';

// HOME
const String chooseVehicleType = '/choose-vehicle-type';
const String exteriorScreen = '/exterior-screen';
const String interiorScreen = '/interior-screen';
const String filmScreen = '/film-screen';
const String paintProtectionScreen = '/paint-protection-screen';
const String productScreen = '/product-screen';
const String maintenanceScreen = '/maintenance-screen';
const String requestScreen = '/request-screen';
const String paymentMethodScreen = '/payment-method-screen';

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

      case onBoardRoot:
        return _getPageRoute(const OnBoardRoot());

      case onBoardWelcome1:
        return _getPageRoute(const OnBoardWelcome1());

      case onBoardWelcome2:
        return _getPageRoute(const OnBoardWelcome2());

      case onBoardWelcome3:
        return _getPageRoute(const OnBoardWelcome3());

      case authLoginScreen:
        return _getPageRoute(const AuthLoginScreen());

      case chooseVehicleType:
        return _getPageRoute(const ChooseVehicleType());

      case exteriorScreen:
        return _getPageRoute(const ExteriorScreen());

      case interiorScreen:
        return _getPageRoute(const InteriorScreen());

        case filmScreen:
        return _getPageRoute(const FilmScreen());

      case paintProtectionScreen:
        return _getPageRoute(const PaintProtectionScreen());

      case productScreen:
        return _getPageRoute(const ProductScreen());

        case maintenanceScreen:
        return _getPageRoute(const MaintenanceScreen());

        case requestScreen:
        return _getPageRoute(const RequestScreen());

        case paymentMethodScreen:
        return _getPageRoute(const PaymentMethodScreen());

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
