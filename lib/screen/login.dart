import 'package:flutter/material.dart';
import 'package:fyp_project/Widget/mybutton.dart';
import 'package:fyp_project/screen/signUp.dart';
import '../Widget/toptitle.dart';
import '../Widget/mytextformfeild.dart';
import '../Widget/mypasswordtextformfield.dart';
import '../Widget/haveAccountOrnot.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = new RegExp(p);
  void validation(context) {
    if (email.text.isEmpty && password.text.isEmpty) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("both are empty")));
    } else if (email.text.isEmpty) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Email is empty")));
    }
    if (!regExp.hasMatch(email.text)) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("email is not valid")));
    } else if (password.text.isEmpty) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("password is empty")));
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffold,
        backgroundColor: Color(0xfff8f8f8),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Toptitle(
                  subTitle: 'Welcome back',
                  title: 'Login',
                ),
                Center(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MyTextFormFeild('email', email),
                        SizedBox(
                          height: 10,
                        ),
                        Mypasswordtextformfield(
                          controller: password,
                          title: 'password',
                        ),
                      ],
                    ),
                  ),
                ),
                Mybutton(
                  name: "Login",
                  onPressed: () {
                    validation(context);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                HaveAccountOrNot(
                  ontap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => SignUp()));
                  },
                  subTitle: 'SignUp',
                  title: 'dont have account',
                )
              ],
            ),
          ),
        ));
  }
}
