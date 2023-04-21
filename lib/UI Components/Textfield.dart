import 'package:flutter/material.dart';
class Textfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const Textfield({
    super.key, this.controller,
    required this.hintText,
    required this.obscureText
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xFF447604)
              )
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide()
          ),
          fillColor: const Color(0xFF447604),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFCFE795))


        ),
      ),
    );
  }
}

