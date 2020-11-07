import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meno_app/src/screens/chooseGenger.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color backgroundclr = Color(0xFFA2B58E);
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ChooseGenderScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundclr,
      body: Center(
        child: Image.asset('assets/images/splashIcon.png'),
      ),
    );
  }
}