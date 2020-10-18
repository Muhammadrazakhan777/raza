import 'package:flutter/material.dart';
import 'mytextformfeild.dart';

class Mypasswordtextformfield extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  Mypasswordtextformfield({this.title, this.controller});

  @override
  _MypasswordtextformfieldState createState() =>
      _MypasswordtextformfieldState();
}

class _MypasswordtextformfieldState extends State<Mypasswordtextformfield> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
              obscureText == true ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.title,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          )),
    );
  }
}
