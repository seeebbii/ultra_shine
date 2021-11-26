import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildBottomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final int pageNumber;
  final Color btnColor;

  const BuildBottomButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.pageNumber,
      required this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.all<Color>(btnColor)),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: 10.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}
