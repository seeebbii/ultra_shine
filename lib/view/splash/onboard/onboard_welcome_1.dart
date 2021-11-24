import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';

class OnBoardWelcome1 extends StatefulWidget {
  const OnBoardWelcome1({Key? key}) : super(key: key);

  @override
  State<OnBoardWelcome1> createState() => _OnBoardWelcome1State();
}

class _OnBoardWelcome1State extends State<OnBoardWelcome1> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePaths.onBoardWelcome1),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [

            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
