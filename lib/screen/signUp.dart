import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_project/Widget/haveAccountOrnot.dart';
import 'package:fyp_project/Widget/mybutton.dart';

import 'package:fyp_project/Widget/mytextformfeild.dart';
import 'package:fyp_project/Widget/toptitle.dart';
import 'package:fyp_project/screen/home.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = new RegExp(p);
  bool isLoading = false;
  UserCredential authResult;
  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on PlatformException catch (e) {
      String message = 'please check your internet connection';
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffold.currentState.showSnackBar(SnackBar(
        content: Text(message),
      ));
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = true;
      });
      scaffold.currentState.showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      await FirebaseFirestore.instance
          .collection('ueseData')
          .doc(authResult.user.uid)
          .set({
        'email': email.text.trim(),
        'fullname': fullname.text,
        'UserNumber': phoneNumber.text,
        'UserAddress': address.text,
      });
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => Home()));
    }
  }

  void validation(context) {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        fullname.text.isEmpty &&
        address.text.isEmpty &&
        phoneNumber.text.isEmpty) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("all feilds are  empty")));
    } else if (fullname.text.isEmpty) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("fullname is empty")));
    } else if (email.text.isEmpty) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Email is empty")));
    }
    if (regExp.hasMatch(email.text)) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("email is not valid")));
    } else if (phoneNumber.text.length == 12) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("phone number must be 11")));
    } else if (password.text.isEmpty) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("password is empty")));
    } else {
      submit();
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffold,
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              Toptitle(
                title: 'SignUp',
                subTitle: 'Create an Account',
              ),
              Container(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextFormFeild('email', email),
                    MyTextFormFeild('fullname', fullname),
                    MyTextFormFeild('phoneNumber', phoneNumber),
                    MyTextFormFeild('address', address),
                    MyTextFormFeild('password', password),
                  ],
                ),
              ),
              Mybutton(
                name: "SignUp",
                onPressed: () {
                  validation(context);
                },
              ),
              HaveAccountOrNot(
                title: 'Login',
                subTitle: 'I already have account',
                ontap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => Login()));
                },
              )
            ],
          ),
        )));
  }
}
