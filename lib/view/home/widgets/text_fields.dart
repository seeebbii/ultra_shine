import 'package:flutter/material.dart';


class InputTextfield extends StatelessWidget {
  const InputTextfield({
    Key? key,
    required this.hintText,
    required this.textInputType,

    required this.controller,
    required this.validator,
    required this.hide,
  }) : super(key: key);

  final String hintText;
  final bool hide;
  final TextInputType textInputType;

  final TextEditingController controller;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hide,
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      decoration: InputDecoration(

        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
    //    prefixIcon: Icon(iconData, color: Colors.redAccent),
        border:
         OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
        focusedBorder:
            OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),),
       
      ),
      validator: validator,
    );
  }
}