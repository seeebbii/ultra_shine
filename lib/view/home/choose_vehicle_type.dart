import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/router/router_generator.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/models/home/choose_vehicle_model.dart';
import 'package:ultra_shine/models/home/choose_vehicle_paintwork_model.dart';

import 'dart:math' as math;

import 'package:ultra_shine/view/components/auth_button.dart';
import 'package:ultra_shine/view/home/widgets/build_vehicle_type.dart';

import 'widgets/build_bottom_buttons.dart';
import 'widgets/build_vehicle_paintwork.dart';

class ChooseVehicleType extends StatefulWidget {
  const ChooseVehicleType({Key? key,}) : super(key: key);

  @override
  State<ChooseVehicleType> createState() => _ChooseVehicleTypeState();
}

class _ChooseVehicleTypeState extends State<ChooseVehicleType>
    with AutomaticKeepAliveClientMixin {
  List<ChooseVehicleModel> carTypes = <ChooseVehicleModel>[
    ChooseVehicleModel(
        value: false, carText: "New Car", imagePath: ImagePaths.typeSmall),
    ChooseVehicleModel(
        value: false, carText: "Medium Car", imagePath: ImagePaths.typeMedium),
    ChooseVehicleModel(
        value: false, carText: "Large Car", imagePath: ImagePaths.typeLarge),
    ChooseVehicleModel(
        value: false,
        carText: "Extra Large Car",
        imagePath: ImagePaths.typeJeep),
  ];

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
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.menu,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       widget.animation!();
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.notifications_active),
      //       color: Colors.black,
      //       onPressed: () {
      //         navigationController.navigateToNamed(notificationScreen);
      //       },
      //     )
      //   ],
      // ),
      body: Stack(
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
                      child: Text(
                        'Choose your Vehicle Type',
                        style: Theme.of(context).textTheme.headline3,
                      ),
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
                            carTypes
                                .forEach((element) => element.value = false);
                            carTypes[index].value = true;
                          });
                        },
                        child: BuildVehicleType(
                          imagePath: carTypes[index].imagePath!,
                          carText: carTypes[index].carText!,
                          value: carTypes[index].value!,
                          index: index,
                        ),
                      );
                    },
                    childCount: carTypes.length,
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
                      child: Text(
                        'Condition of your paintwork?',
                        style: Theme.of(context).textTheme.headline3,
                      ),
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
                            paintWorkTypes
                                .forEach((element) => element.value = false);
                            paintWorkTypes[index].value = true;
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
                            onPressed: () {
                              stepperController.currentPage.value = 0;
                              navigationController.goBack();
                            },
                            pageNumber: 0,
                            btnColor: Colors.grey,
                          )),
                          Expanded(
                              child: BuildBottomButton(
                            buttonText: "Next",
                            onPressed: () {
                              stepperController.toNextPage();
                            },
                            pageNumber: 0,
                            btnColor: primaryColor,
                          )),
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
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
