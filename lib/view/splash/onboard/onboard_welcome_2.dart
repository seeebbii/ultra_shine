import 'package:flutter/material.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';

class OnBoardWelcome2 extends StatefulWidget {
  const OnBoardWelcome2({Key? key}) : super(key: key);

  @override
  State<OnBoardWelcome2> createState() => _OnBoardWelcome2State();
}

class _OnBoardWelcome2State extends State<OnBoardWelcome2> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePaths.onBoardWelcome2),
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