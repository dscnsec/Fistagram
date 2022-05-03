import 'package:figma_squircle/figma_squircle.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isObscure;
  final String hintText;
  final TextInputType textInputType;
  final IconData iconType;
  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      required this.iconType,
      this.isObscure = false,
      required this.hintText,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: SmoothBorderRadius(
        cornerRadius: 6,
        cornerSmoothing: 1,
      ),
    );

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          prefixIcon: Icon(iconType, color: primaryColor),
          hintText: hintText,
          hintStyle:
              const TextStyle(fontWeight: FontWeight.w300, color: primaryColor),
          border: inputBorder,
          focusedBorder: inputBorder,
          filled: true,
          fillColor: primaryInputBoxColor,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: textInputType,
      obscureText: isObscure,
    );
  }
}
