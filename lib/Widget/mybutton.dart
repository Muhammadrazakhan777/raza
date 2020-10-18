import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String name;
  final Function onPressed;
  Mybutton({this.name, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: RaisedButton(
        color: Color.fromRGBO(141, 35, 109, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
