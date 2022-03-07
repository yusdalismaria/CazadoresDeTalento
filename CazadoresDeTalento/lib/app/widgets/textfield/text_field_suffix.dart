import 'package:flutter/material.dart';

class TextFieldWidgetSuffix extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;

  final bool obscureText;
  final String validator;
  final TextEditingController controller;
  final TextInputType inputType;

  TextFieldWidgetSuffix({
    required this.controller,
    required this.inputType,
    required this.validator,
    required this.hintText,
    required this.prefixIconData,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      validator: (value) {
        if (value!.length == 0) {
          return '' + validator.toString();
        }
        return null;
      },
      obscureText: obscureText,
      cursorColor: Colors.blue,
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
        focusColor: Colors.blue,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Colors.blue,
        ),
      ),
    );
  }
}
