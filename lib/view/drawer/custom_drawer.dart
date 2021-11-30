import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/router/router_generator.dart';
import 'package:ultra_shine/app/utils/colors.dart';

import '../home/choose_vehicle_type.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawer() => Container(
          child: Drawer(
            elevation: 0,
            backgroundColor: primaryColor,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.05.sh,
                    ),
                    CircleAvatar(
                      radius: 45.r,
                      backgroundImage: const AssetImage(ImagePaths.paint),
                      foregroundColor: Colors.white38,
                    ),
                    SizedBox(
                      height: 0.015.sh,
                    ),
                    Text(
                      "David Alex",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 18.sp, color: Colors.white),
                    ),
                    Text(
                      "david@gmail.com",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 0.015.sh,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    InkWell(
                      onTap: () {
                        navigationController.navigateToNamed(personalInfo);
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5.sp),
                            child: Icon(Icons.person,
                                color: Colors.white, size: 18.sp),
                          ),
                          Text(
                            "Personal Info",
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                    color: Colors.white, fontSize: 11.sp),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.05.sh,
                    ),
                    InkWell(
                      onTap: () {
                        navigationController.navigateToNamed(myAppointments);
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5.sp),
                            child: Icon(Icons.calendar_today,
                                color: Colors.white, size: 18.sp),
                          ),
                          Text(
                            "My Appointments",
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                    color: Colors.white, fontSize: 11.sp),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.05.sh,
                    ),
                    InkWell(
                      onTap: () {
                        navigationController.navigateToNamed(authLoginScreen);
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5.sp),
                            child: Icon(
                              Icons.login,
                              color: Colors.white,
                              size: 18.sp,
                            ),
                          ),
                          Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                    color: Colors.white, fontSize: 11.sp),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

    Widget _buildHome() => Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.25),
              spreadRadius: 10,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ChooseVehicleType(
          animation: toggleAnimation,
        ));

    return Scaffold(
      backgroundColor: primaryColor,
      body: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            double slide = 200.0 * animationController.value;
            double scale = 1 - (animationController.value * 0.2);
            return Stack(
              children: [
                _buildDrawer(),
                Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: _buildHome(),
                      onTap: () {
                        animationController.reverse();
                      },
                      onPanUpdate: (details) {
                        if (details.delta.dx < 0) {
                          animationController.reverse();
                        }
                      },
                    )),
              ],
            );
          }),
    );
  }

  void toggleAnimation() {
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
  }
}
