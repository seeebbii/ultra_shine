import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/view/splash/onboard/widgets/onboard_text.dart';

class OnBoardWelcome2 extends StatefulWidget {
  const OnBoardWelcome2({Key? key}) : super(key: key);

  @override
  State<OnBoardWelcome2> createState() => _OnBoardWelcome2State();
}

class _OnBoardWelcome2State extends State<OnBoardWelcome2>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              image: AssetImage(ImagePaths.onBoardWelcome2),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildTextWidget(),
              SizedBox(
                height: 0.2.sh,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _buildTextWidget() {
    return const OnBoardText(
      title: 'Auto Service Builder',
      subTitle: 'Lorem ipsum is simply dummy text of the printing 1500s,',
    );
  }
}
