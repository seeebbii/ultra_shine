import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {

  final TextEditingController controller;
  Color containerBoxColor;
  double borderRadius;
  String? hintText;

  bool obSecureText;
  dynamic validator;
  TextInputAction action;
  TextInputType keyType;

  Widget suffixIcon;
  List<TextInputFormatter>? formatter = [];

  AutovalidateMode? validateMode = AutovalidateMode.disabled;

  AuthTextField({Key? key, required this.controller,
    required this.containerBoxColor,
    required this.borderRadius,
    required this.obSecureText,
    required this.validator,
    required this.action,
    required this.keyType,
    required this.suffixIcon,
    this.hintText, this.formatter = const [], this.validateMode = AutovalidateMode.disabled, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5
      ),
      decoration: BoxDecoration(
          color: containerBoxColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: TextFormField(
        style: Theme
            .of(context)
            .textTheme
            .bodyText1,
        cursorWidth: 1,
        textInputAction: action,
        keyboardType: keyType,
        autovalidateMode: validateMode,
        inputFormatters: formatter,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: Theme
              .of(context)
              .inputDecorationTheme
              .hintStyle,
          suffixIcon: suffixIcon,
        ),
        obscureText: obSecureText,
        cursorColor: Colors.red.shade400,
        validator: validator,
      ),
    );
  }
}
