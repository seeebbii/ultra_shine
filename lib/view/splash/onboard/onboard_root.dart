import 'package:flutter/material.dart';
import 'package:ultra_shine/view/splash/onboard/onboard_welcome_1.dart';
import 'package:ultra_shine/view/splash/onboard/onboard_welcome_3.dart';

import 'onboard_welcome_2.dart';

class OnBoardRoot extends StatefulWidget {
  OnBoardRoot({Key? key}) : super(key: key);

  @override
  State<OnBoardRoot> createState() => _OnBoardRootState();
}

class _OnBoardRootState extends State<OnBoardRoot> with AutomaticKeepAliveClientMixin {
  final pageViewController = PageController(initialPage: 0, keepPage: true);

  List<Widget> pageList = <Widget> [
    const OnBoardWelcome1(),
    const OnBoardWelcome2(),
    const OnBoardWelcome3(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(itemBuilder: (ctx, index){
          return pageList[index];
        }, itemCount: pageList.length,),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
