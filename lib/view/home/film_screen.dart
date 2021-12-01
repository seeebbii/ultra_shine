import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'dart:math' as math;
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/view/home/widgets/build_bottom_buttons.dart';
import 'package:ultra_shine/view/home/widgets/build_film_card.dart';

class FilmScreen extends StatefulWidget {
  const FilmScreen({Key? key}) : super(key: key);

  @override
  _FilmScreenState createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen>
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
                padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            filmsController.filmsModel
                                .forEach((element) => element.value = false);
                            filmsController.filmsModel.forEach((element) {
                              // element.types
                              //     .forEach((opt) => opt.selected = false);
                            });
                            filmsController.filmsModel[index].value = true;
                          });
                        },
                        child: BuildFilmCard(
                          model: filmsController.filmsModel[index],
                        ));
                  }, childCount: filmsController.filmsModel.length),
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
                            pageNumber: 3,
                            btnColor: Colors.black,
                          )),
                          Expanded(
                              child: BuildBottomButton(
                            buttonText: "Next",
                            onPressed: () => stepperController.toNextPage(),
                            pageNumber: 3,
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
