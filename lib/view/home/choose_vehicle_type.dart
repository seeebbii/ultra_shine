import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/controller/api/request/request_controller.dart';
import 'package:ultra_shine/models/home/choose_vehicle_paintwork_model.dart';
import 'dart:math' as math;
import 'package:ultra_shine/view/home/widgets/build_vehicle_type.dart';
import 'widgets/build_bottom_buttons.dart';
import 'widgets/build_vehicle_paintwork.dart';

class ChooseVehicleType extends StatefulWidget {
  const ChooseVehicleType({Key? key, this.animation}) : super(key: key);
  final VoidCallback? animation;

  @override
  State<ChooseVehicleType> createState() => _ChooseVehicleTypeState();
}

class _ChooseVehicleTypeState extends State<ChooseVehicleType>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _animationController;
  late Animation _animation;

  void homelistener(status) {
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(homelistener);
      _animationController.reset();
      _animation = Tween(begin: 0.0, end: 0.0).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
      _animationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    Get.put(RequestController());
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ))
      ..addStatusListener(homelistener);

    _animationController.forward();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
    // you need this
  }

  List<ChooseVehiclePaintworkModel> paintWorkTypes =
      <ChooseVehiclePaintworkModel>[
    ChooseVehiclePaintworkModel(
        value: false, carText: "New Car", imagePath: ImagePaths.ptNew),
    ChooseVehiclePaintworkModel(
        value: false, carText: "Light Swirls", imagePath: ImagePaths.ptLight),
    ChooseVehiclePaintworkModel(
        value: false, carText: "Large Swirls", imagePath: ImagePaths.ptLarge),
    ChooseVehiclePaintworkModel(
        value: false, carText: "Deep Scratches", imagePath: ImagePaths.ptDeep),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            widget.animation!();
          }
        },
        child: Stack(
          children: [
            Positioned(
              right: -0.55.sw,
              bottom: 0.99.sw,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Transform.rotate(
                  angle: -math.pi / 6.5.sp,
                  child: Image.asset(
                    ImagePaths.tireBackground,
                    width: 0.9.sw,
                  ),
                ),
              ),
            ),
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.sp, vertical: 2.sp),
                        child: _buildAnim('Choose Your Vechicle Type'),
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.sp, vertical: 2.sp),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Obx(() => InkWell(
                              onTap: () {
                                setState(() {
                                  vehicleTypeController.vehicleTypes.forEach(
                                      (element) => element.value = false);
                                  vehicleTypeController
                                      .vehicleTypes[index].value = true;
                                });
                                vehicleTypeController
                                    .vehicleTypeSelected.value = true;
                              },
                              child: BuildVehicleType(
                                imagePath: vehicleTypeController
                                    .vehicleTypes[index].imagePath!,
                                carText: vehicleTypeController
                                    .vehicleTypes[index].carText!,
                                value: vehicleTypeController
                                    .vehicleTypes[index].value!,
                                index: index,
                              ),
                            ));
                      },
                      childCount: vehicleTypeController.vehicleTypes.length,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.sp,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.sp, vertical: 2.sp),
                        child: _buildAnim('Condition of your paintwork?'),
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.sp, vertical: 2.sp),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              for (var element in paintWorkTypes) {
                                element.value = false;
                              }
                              paintWorkTypes[index].value = true;
                              vehiclePaintWorkController
                                  .vehiclePainWorkSelected.value = true;
                            });
                          },
                          child: BuildVehiclePaintwork(
                            imagePath: paintWorkTypes[index].imagePath!,
                            carText: paintWorkTypes[index].carText!,
                            value: paintWorkTypes[index].value!,
                            index: index,
                          ),
                        );
                      },
                      childCount: paintWorkTypes.length,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.sp,
                        childAspectRatio: 3 / 2.5,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 0.05.sh),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Row(
                          children: [
                            Expanded(
                                child: BuildBottomButton(
                              buttonText: "Previous",
                              onPressed: () => navigationController.goBack(),
                              pageNumber: 1,
                              btnColor: Colors.grey,
                            )),
                            Expanded(
                                child: Obx(() => BuildBottomButton(
                                      buttonText: "Next",
                                      onPressed: vehicleTypeController
                                                  .vehicleTypeSelected.value &&
                                              vehiclePaintWorkController
                                                  .vehiclePainWorkSelected.value
                                          ? () => stepperController.toNextPage()
                                          : () {},
                                      pageNumber: 1,
                                      btnColor: primaryColor,
                                    ))),
                            // AuthButton(buttonText: "Previous", onPressed: (){}),
                          ],
                        ),
                      ),
                      SizedBox(height: 0.05.sh),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  AnimatedBuilder _buildAnim(String headline) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Transform(
              transform:
                  Matrix4.translationValues(_animation.value * 200, 0.0, 0.0),
              child: Text(
                headline,
                style: Theme.of(context).textTheme.headline3,
              ),
            ));
  }

  // ignore: todo
  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}
