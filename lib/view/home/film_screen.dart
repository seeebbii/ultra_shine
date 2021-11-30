import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'dart:math' as math;

import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/router/router_generator.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/models/home/film_card_model.dart';
import 'package:ultra_shine/view/home/widgets/build_bottom_buttons.dart';
import 'package:ultra_shine/view/home/widgets/build_film_card.dart';

class FilmScreen extends StatefulWidget {
  const FilmScreen({Key? key}) : super(key: key);

  @override
  _FilmScreenState createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> with AutomaticKeepAliveClientMixin {

  List<FilmOptions> filmOptions = <FilmOptions>[
    FilmOptions(packageName: "Price", price: 700, selected: false),
  ];

  late List<FilmCardModel> filmCard;

  @override
  void initState() {
    filmCard = <FilmCardModel>[
      FilmCardModel(
          filmOptions: filmOptions,
          titleText: "Window Tint",
          subTitleText:
          "Cleaning, sanitizing, reconditioning of all interior surfaces.",
          value: false),
      FilmCardModel(
          filmOptions: filmOptions,
          titleText: "Paint Protection Film, PPF",
          subTitleText:
          "Glossy & Matte | Self-Healing | Top Coated | Computer Pre-Cut | No Yellowing | Crystal Clear ",
          value: false),
      FilmCardModel(
          filmOptions: filmOptions,
          titleText: "Windshield Exterior Protection Film",
          subTitleText:
          "Exterior Protection for the front Windshield from Stone Chips ",
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
                      child: Text(
                        'FILMS',
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
                EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            filmCard
                                .forEach((element) => element.value = false);
                            filmCard.forEach((element) {
                              element.filmOptions
                                  .forEach((opt) => opt.selected = false);
                            });
                            filmCard[index].value = true;
                          });
                        },
                        child: BuildFilmCard(
                          model: filmCard[index],
                        ));
                  }, childCount: filmCard.length),
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
                          Expanded(child: BuildBottomButton(buttonText: "Previous", onPressed:  ()=>stepperController.toPreviousPage(), pageNumber: 3, btnColor: Colors.black,)),
                          Expanded(child: BuildBottomButton(buttonText: "Next", onPressed: ()=> stepperController.toNextPage(), pageNumber: 3, btnColor: primaryColor,)),
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
