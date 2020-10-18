import 'package:flutter/material.dart';

class HaveAccountOrNot extends StatelessWidget {
  final Function ontap;
  final String title, subTitle;
  HaveAccountOrNot({this.ontap, this.title, this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        GestureDetector(
            onTap: ontap,
            child: Text(
              subTitle,
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColor),
            ))
      ],
    );
  }
}
