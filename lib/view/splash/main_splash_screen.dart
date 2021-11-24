import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/router/router_generator.dart';
import 'package:ultra_shine/view/authentication/auth_login_screen.dart';

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({Key? key}) : super(key: key);

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // TODO ::  we will later navigate to auth decider
    Timer(const Duration(seconds: 4),
        () => navigationController.getOffAll(onBoardRoot));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePaths.mainSplash),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                  child: Hero(
                tag: 'main-logo',
                child: Image.asset(
                  ImagePaths.ultraShineLogo,
                  height: 0.25.sh,
                  filterQuality: FilterQuality.high,
                  color: Colors.white,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
