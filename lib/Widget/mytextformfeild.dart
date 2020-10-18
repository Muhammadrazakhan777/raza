import 'package:flutter/material.dart';

class MyTextFormFeild extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  MyTextFormFeild(this.title, this.controller);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: title,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            )));
  }
}
