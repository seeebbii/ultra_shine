import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/view/splash/onboard/onboard_welcome_1.dart';
import 'package:ultra_shine/view/splash/onboard/onboard_welcome_3.dart';

import 'onboard_welcome_2.dart';

class OnBoardRoot extends StatefulWidget {
  const OnBoardRoot({Key? key}) : super(key: key);

  @override
  State<OnBoardRoot> createState() => _OnBoardRootState();
}

class _OnBoardRootState extends State<OnBoardRoot>
    with AutomaticKeepAliveClientMixin {
  final pageViewController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 0.99);
  int currentIndex = 0;

  List<Widget> pageList = <Widget>[
    const OnBoardWelcome1(),
    const OnBoardWelcome2(),
    const OnBoardWelcome3(),
  ];

  GestureDetector buildDot(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentIndex = index;
        pageViewController.animateToPage(index,
            duration: const Duration(milliseconds: 250),
            curve: Curves.bounceInOut);
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 1.5),
          child: Image.asset(ImagePaths.sliderRedDot,
              scale: 0.65.sp,
              color: currentIndex == index ? Colors.red : Colors.white,
              width: 10.sp,
              height: 10.sp)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
            ),
            PageView.builder(
              controller: pageViewController,
              itemBuilder: (ctx, index) {
                return pageList[index];
              },
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: pageList.length,
            ),
            currentIndex != 2
                ? Positioned(
                    top: 0.05.sh,
                    right: 0.03.sw,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                            pageViewController.animateToPage(2,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.bounceInOut);
                          });
                        },
                        child: Text(
                          "Skip",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.white),
                        )),
                  )
                : const SizedBox.shrink(),
            currentIndex != 2
                ? Positioned(
                    bottom: 0.07.sh,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pageList.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
