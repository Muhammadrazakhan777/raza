import 'package:flutter/material.dart';
import './screen/login.dart';
import './screen/signUp.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Map<int, Color> color = {
    50: Color.fromRGBO(141, 35, 109, 1),
    100: Color.fromRGBO(141, 35, 109, 1),
    200: Color.fromRGBO(141, 35, 109, 1),
    300: Color.fromRGBO(141, 35, 109, 1),
    400: Color.fromRGBO(141, 35, 109, 1),
    500: Color.fromRGBO(141, 35, 109, 1),
    600: Color.fromRGBO(141, 35, 109, 1),
    700: Color.fromRGBO(141, 35, 109, 1),
    800: Color.fromRGBO(141, 35, 109, 1),
    900: Color.fromRGBO(141, 35, 109, 1),
  };
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: SignUp(),
    );
  }
}
