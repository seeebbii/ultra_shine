import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ultra_shine/app/constant/initialize_controllers.dart';
import 'package:ultra_shine/app/router/router_generator.dart';
import 'app/constant/image_paths.dart';
import 'app/core/notification_service.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // NotificationInitilization.initilaizedPushNotifications();
  InitializeControllers.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    ImagePaths.preCacheImages(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: myTheme,
              initialRoute: mainSplashScreen,
              onGenerateRoute: RouteGenerator.onGeneratedRoutes,
            ));
  }
}
