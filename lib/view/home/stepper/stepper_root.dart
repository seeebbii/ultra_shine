import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/router/router_generator.dart';
import 'package:ultra_shine/view/home/choose_vehicle_type.dart';
import 'package:ultra_shine/view/home/exterior_screen.dart';
import 'package:ultra_shine/view/home/film_screen.dart';
import 'package:ultra_shine/view/home/interior_screen.dart';
import 'package:ultra_shine/view/home/maintenance_screen.dart';
import 'package:ultra_shine/view/home/paint_protection_screen.dart';
import 'package:ultra_shine/view/home/product_screen.dart';
import 'package:ultra_shine/view/home/request_screen.dart';

class StepperRoot extends StatefulWidget {
  const StepperRoot({Key? key, this.animation}) : super(key: key);
  final VoidCallback? animation;

  @override
  State<StepperRoot> createState() => _StepperRootState();
}

class _StepperRootState extends State<StepperRoot>
    with AutomaticKeepAliveClientMixin {
  int activeStep = 0;

  final List<Widget> widgetList = <Widget>[
    const ChooseVehicleType(),
    const ExteriorScreen(),
    const InteriorScreen(),
    const FilmScreen(),
    const PaintProtectionScreen(),
    const ProductScreen(),
    const MaintenanceScreen(),
    const RequestScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            widget.animation!();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                widget.animation!();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_active),
                color: Colors.black,
                onPressed: () {
                  navigationController.navigateToNamed(notificationScreen);
                },
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  children: widgetList,
                  controller: stepperController.pageViewController,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              Container(
                height: 0.06.sh,
                padding: EdgeInsets.symmetric(vertical: 0.01.sh),
                child: Obx(() => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 0.07.sh,
                          width: 0.07.sw,
                          decoration: BoxDecoration(
                              color: stepperController.currentPage.value > 0
                                  ? Colors.red
                                  : Colors.grey.shade300,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: stepperController.currentPage.value > 0
                                ? 15.sp
                                : 13.sp,
                          ),
                        ),
                        SizedBox(
                          width: 15.sp,
                          child: const Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                        Container(
                          height: 0.07.sh,
                          width: 0.07.sw,
                          decoration: BoxDecoration(
                              color: stepperController.currentPage.value > 2
                                  ? Colors.red
                                  : Colors.grey.shade300,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: stepperController.currentPage.value > 2
                                ? 15.sp
                                : 13.sp,
                          ),
                        ),
                        SizedBox(
                          width: 15.sp,
                          child: const Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                        Container(
                          height: 0.07.sh,
                          width: 0.07.sw,
                          decoration: BoxDecoration(
                              color: stepperController.currentPage.value > 2
                                  ? Colors.red
                                  : Colors.grey.shade300,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: stepperController.currentPage.value > 2
                                ? 15.sp
                                : 13.sp,
                          ),
                        ),
                        SizedBox(
                          width: 15.sp,
                          child: const Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                        Container(
                          height: 0.07.sh,
                          width: 0.07.sw,
                          decoration: BoxDecoration(
                              color: stepperController.currentPage.value > 3
                                  ? Colors.red
                                  : Colors.grey.shade300,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: stepperController.currentPage.value > 3
                                ? 15.sp
                                : 13.sp,
                          ),
                        ),
                        SizedBox(
                          width: 15.sp,
                          child: const Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                        Container(
                          height: 0.07.sh,
                          width: 0.07.sw,
                          decoration: BoxDecoration(
                              color: stepperController.currentPage.value > 4
                                  ? Colors.red
                                  : Colors.grey.shade300,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: stepperController.currentPage.value > 4
                                ? 15.sp
                                : 13.sp,
                          ),
                        ),
                        SizedBox(
                          width: 15.sp,
                          child: const Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                        Container(
                          height: 0.07.sh,
                          width: 0.07.sw,
                          decoration: BoxDecoration(
                              color: stepperController.currentPage.value >= 7
                                  ? Colors.red
                                  : Colors.grey.shade300,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: stepperController.currentPage.value >= 7
                                ? 15.sp
                                : 13.sp,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 0.001.sh),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepperWidget() {
    return Row(
      children: [
        Container(
          height: 0.07.sh,
          width: 0.07.sw,
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 15.sp,
          ),
        ),
        SizedBox(
          width: 15.sp,
          child: const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildLastStepper() {
    return Container(
      height: 0.07.sh,
      width: 0.07.sw,
      decoration:
          const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 15.sp,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
