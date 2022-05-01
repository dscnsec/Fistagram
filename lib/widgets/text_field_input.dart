import 'package:fistagram/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget{
  final TextEditingController textEditingController;
  final bool isObscure;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({Key? key, required this.textEditingController, this.isObscure=false, required this.hintText, required this.textInputType});

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4))
    );

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        // hintStyle: const TextStyle(
        //   color: primaryColor
        // ),
        border: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        fillColor: secondaryBackgroundColor,
        contentPadding: const EdgeInsets.all(8)
      ),
      keyboardType: textInputType,
      obscureText: isObscure,

    );
  }
  
}