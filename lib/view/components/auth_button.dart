import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const AuthButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: onPressed,
          child: Text(buttonText, style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 10.sp, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),),
        ),
      ),
    );
  }
}
