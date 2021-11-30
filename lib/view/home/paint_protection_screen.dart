import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/models/home/paint_protection_model.dart';
import 'package:ultra_shine/view/home/widgets/build_bottom_buttons.dart';
import 'package:ultra_shine/view/home/widgets/build_paint_protection.dart';

class PaintProtectionScreen extends StatefulWidget {
  const PaintProtectionScreen({Key? key}) : super(key: key);

  @override
  _PaintProtectionScreenState createState() => _PaintProtectionScreenState();
}

class _PaintProtectionScreenState extends State<PaintProtectionScreen> {
  List<RatingTile> ratingTiles = <RatingTile>[
    RatingTile(
      packageName: "Durability",
      value: 5,
    ),
    RatingTile(
      packageName: "Ease of Application",
      value: 4,
    ),
    RatingTile(
      packageName: "Sickness",
      value: 3.5,
    ),
    RatingTile(
      packageName: "Gloss",
      value: 1.5,
    ),
  ];

  late List<PaintProtectionModel> paintProtectionModel;

  @override
  void initState() {
    paintProtectionModel = <PaintProtectionModel>[
      PaintProtectionModel(
          ratingTile: ratingTiles,
          titleText: "Heading",
          subTitleText:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
          value: false),
      PaintProtectionModel(
          ratingTile: ratingTiles,
          titleText: "Heading",
          subTitleText:
              "Glossy & Matte | Self-Healing | Top Coated | Computer Pre-Cut | No Yellowing | Crystal Clear ",
          value: false),
      PaintProtectionModel(
          ratingTile: ratingTiles,
          titleText: "Heading",
          subTitleText:
              "Exterior Protection for the front Windshield from Stone Chips ",
          value: false),
      PaintProtectionModel(
          ratingTile: ratingTiles,
          titleText: "Heading",
          subTitleText:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
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
                      child: Text(
                        'Paint Protection Options?',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.sp,
                      ),
                      child: Text(
                        "Paint Protection Options",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 2.sp),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Cost: ",
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
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            paintProtectionModel
                                .forEach((element) => element.value = false);
                            paintProtectionModel[index].value = true;
                          });
                        },
                        child: BuildPaintProtection(
                          model: paintProtectionModel[index],
                        ),
                      );
                    },
                    childCount: paintProtectionModel.length,
                  ),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300.sp,
                      childAspectRatio: 0.33.sp,
                      // childAspectRatio: 5 / 6,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 0
                      
                      ),
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
                          Expanded(child: BuildBottomButton(buttonText: "Previous", onPressed:  ()=>stepperController.toPreviousPage(), pageNumber: 4, btnColor: Colors.black,)),
                          Expanded(child: BuildBottomButton(buttonText: "Next", onPressed: ()=> stepperController.toNextPage(), pageNumber: 4, btnColor: primaryColor,)),
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
