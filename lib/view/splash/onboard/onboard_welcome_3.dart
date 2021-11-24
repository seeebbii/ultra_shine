import 'package:flutter/material.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';

class OnBoardWelcome3 extends StatefulWidget {
  const OnBoardWelcome3({Key? key}) : super(key: key);

  @override
  State<OnBoardWelcome3> createState() => _OnBoardWelcome3State();
}

class _OnBoardWelcome3State extends State<OnBoardWelcome3> with AutomaticKeepAliveClientMixin  {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePaths.onBoardWelcome3),
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