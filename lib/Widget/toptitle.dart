import 'package:flutter/material.dart';

class Toptitle extends StatelessWidget {
  final String title, subTitle;
  Toptitle({this.title, this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10,),
      color: Color.fromRGBO(141, 35, 109, 1),
      child: Column(
        children: <Widget>[
          Text(
            
            title,
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            subTitle,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
