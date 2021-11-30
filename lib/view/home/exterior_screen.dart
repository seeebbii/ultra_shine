import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/router/router_generator.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/models/home/exterior_card_model.dart';
import 'dart:math' as math;

import 'package:ultra_shine/view/home/widgets/build_bottom_buttons.dart';
import 'package:ultra_shine/view/home/widgets/build_exterior_card.dart';

class ExteriorScreen extends StatefulWidget {
  const ExteriorScreen({Key? key}) : super(key: key);

  @override
  State<ExteriorScreen> createState() => _ExteriorScreenState();
}

class _ExteriorScreenState extends State<ExteriorScreen> {
  List<ExteriorOptions> exteriorOptions = <ExteriorOptions>[
    ExteriorOptions(packageName: "Small", price: 700, selected: false),
    ExteriorOptions(packageName: "Medium", price: 800, selected: false),
    ExteriorOptions(packageName: "Large", price: 900, selected: false),
  ];

  late List<ExteriorCardModel> exteriorCard;

  @override
  void initState() {
    exteriorCard = <ExteriorCardModel>[
      ExteriorCardModel(
          exteriorOptions: exteriorOptions,
          titleText: "Single Stage Polish",
          subTitleText:
              "Removes superficial scratches & revives color | good for light colors & soft paint",
          value: false),
      ExteriorCardModel(
          exteriorOptions: exteriorOptions,
          titleText: "Concours Multi-Stage Paint Correction",
          subTitleText:
              "Removes superficial scratches & revives color | good for light colors & soft paint",
          value: false),
      ExteriorCardModel(
          exteriorOptions: exteriorOptions,
          titleText: "Exterior Nano Ceramic Coatings",
          subTitleText: "Addresses paint, wheels, glass, plastic trim.",
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
                          Text("\$0.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: primaryColor)),
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
                          setState(() {
                            exteriorCard
                                .forEach((element) => element.value = false);
                            exteriorCard.forEach((element) {
                              element.exteriorOptions
                                  .forEach((opt) => opt.selected = false);
                            });
                            exteriorCard[index].value = true;
                          });
                        },
                        child: BuildExteriorCard(
                          model: exteriorCard[index],
                        ));
                  }, childCount: exteriorCard.length),
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
                          Expanded(child: BuildBottomButton(buttonText: "Previous", onPressed:  ()=>stepperController.toPreviousPage(), pageNumber: 1, btnColor: Colors.black,)),
                          Expanded(child: BuildBottomButton(buttonText: "Next", onPressed: ()=>stepperController.toNextPage(), pageNumber: 1, btnColor: primaryColor,)),
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
}
