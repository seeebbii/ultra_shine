import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'dart:math' as math;

import 'package:ultra_shine/view/home/widgets/build_bottom_buttons.dart';
import 'package:ultra_shine/view/home/widgets/build_exterior_card.dart';

class ExteriorScreen extends StatefulWidget {
  const ExteriorScreen({Key? key}) : super(key: key);

  @override
  State<ExteriorScreen> createState() => _ExteriorScreenState();
}

class _ExteriorScreenState extends State<ExteriorScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -0.55.sw,
            bottom: 0.8.sh,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Transform.rotate(
                angle: -math.pi / 6.5.sp,
                child: Image.asset(
                  ImagePaths.tireBackground,
                  width: 0.8.sw,
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
                          horizontal: 15.sp, vertical: 2.sp),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 10.sp),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                ImagePaths.exteriorCar,
                                scale: 0.9,
                              ),
                              SizedBox(
                                width: 0.01.sw,
                              ),
                              Text(
                                "EXTERIOR",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        color: Colors.white, fontSize: 10.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 2.sp),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Polishing Cost: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          Obx(() => (Text(
                              "${polishTypeController.selectedPolishType.value.types?[polishTypeController.index.value].price}.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: primaryColor)))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.sp, right: 25.sp, top: 2.sp, bottom: 2.sp),
                      child: Text(
                        'How much polishing do you require?',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 5.sp),
                      child: Text(
                        'Please select the amount of surface prep you require',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            for (var element
                                in polishTypeController.polishTypes) {
                              element.isSelected = false;
                            }
                            for (var element
                                in polishTypeController.polishTypes) {
                              for (var opt in element.types!) {
                                opt.selected = false;
                              }
                            }
                            polishTypeController.polishTypes[index].isSelected =
                                true;
                            polishTypeController.selectedPolishType.value =
                                polishTypeController.polishTypes[index];
                            //  polishTypeController.index.value = index;
                            // polishTypeController.packageSelected.value = false;
                            // polishTypeController.optionSelected.value = true;
                          });
                        },
                        child: BuildExteriorCard(
                          model: polishTypeController.polishTypes[index],
                        ));
                  }, childCount: polishTypeController.polishTypes.length),
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
                            onPressed: () => stepperController.toPreviousPage(),
                            pageNumber: 1,
                            btnColor: Colors.black,
                          )),
                          Expanded(
                              child: BuildBottomButton(
                            buttonText: "Next",
                            onPressed: () {
                              if (polishTypeController.selectedPolishType.value
                                          .isSelected ==
                                      true &&
                                  // ignore: unrelated_type_equality_checks
                                  polishTypeController
                                          .selectedPolishType
                                          .value
                                          .types?[
                                              polishTypeController.index.value]
                                          .selected ==
                                      true) {
                                stepperController.toNextPage();
                              }
                            },
                            pageNumber: 1,
                            btnColor: primaryColor,
                          )),
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
