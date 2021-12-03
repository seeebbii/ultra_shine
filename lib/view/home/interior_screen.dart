import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'dart:math' as math;

import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/router/router_generator.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/models/home/interior_card_model.dart';
import 'package:ultra_shine/view/home/widgets/build_bottom_buttons.dart';
import 'package:ultra_shine/view/home/widgets/build_interior_card.dart';

class InteriorScreen extends StatefulWidget {
  const InteriorScreen({Key? key}) : super(key: key);

  @override
  State<InteriorScreen> createState() => _InteriorScreenState();
}

class _InteriorScreenState extends State<InteriorScreen> with AutomaticKeepAliveClientMixin {

  List<InteriorOptions> interiorOptions = <InteriorOptions>[
    InteriorOptions(packageName: "Low", price: 300, selected: false),
    InteriorOptions(packageName: "Medium", price: 500, selected: false),
    InteriorOptions(packageName: "High", price: 700, selected: false),
  ];

  late List<InteriorCardModel> interiorCard;

  @override
  void initState() {
    interiorCard = <InteriorCardModel>[
      InteriorCardModel(
          interiorOptions: interiorOptions,
          titleText: "Interior Detailing",
          subTitleText:
          "Cleaning, sanitizing, reconditioning of all interior surfaces.",
          value: false),
      InteriorCardModel(
          interiorOptions: interiorOptions,
          titleText: "Interior Nano Ceramic Coatings",
          subTitleText:
          "removes superficial scratches & revives color | good for light colors & soft paint",
          value: false),
    ];
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
          Positioned(
            top: 0.6.sh,
            right: 0.80.sw,
            child: Container(
              alignment: Alignment.bottomLeft,
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
                                ImagePaths.interiorSeat,
                                scale: 0.9,
                              ),
                              SizedBox(
                                width: 0.01.sw,
                              ),
                              Text(
                                "INTERIOR",
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
                          Obx(() => Text("\$${requestController.totalAmount}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor))),
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
                padding:
                EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(
                        onTap: () {
                          requestController.interiorAmount = 0.00;
                          requestController.interiorPrevAmount = 0.00;
                          requestController.calculateTotalAmount();
                          setState(() {
                            interiorCard
                                .forEach((element) => element.value = false);
                            interiorCard.forEach((element) {
                              element.interiorOptions
                                  .forEach((opt) => opt.selected = false);
                            });
                            interiorCard[index].value = true;
                          });
                        },
                        child: BuildInteriorCard(
                          model: interiorCard[index],
                        ));
                  }, childCount: interiorCard.length),
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
                          Expanded(child: BuildBottomButton(buttonText: "Previous", onPressed:  ()=>stepperController.toPreviousPage(), pageNumber: 2, btnColor: Colors.black,)),
                          Expanded(child: BuildBottomButton(buttonText: "Next", onPressed: ()=> stepperController.toNextPage(), pageNumber: 2, btnColor: primaryColor,)),
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
