import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardText extends StatelessWidget {
  final String title;
  final String subTitle;

  const OnBoardText({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.sp),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
          child: Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
