import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';

class AuthSocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String socialName;
  final String imagePath;
  final Color backGroundColor;
  final Color textColor;

  const AuthSocialButton(
      {Key? key,
      required this.onPressed,
      required this.socialName,
      required this.imagePath,
      required this.backGroundColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 16)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(backGroundColor),
              elevation: MaterialStateProperty.all(0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(imagePath),
              Text(
                socialName,
                style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              ),
            ],
          )),
    ));
  }
}
