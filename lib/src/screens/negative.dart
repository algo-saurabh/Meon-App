import 'package:flutter/material.dart';

class NegativeEmotion extends StatelessWidget {

  Color backgroundclr = Color(0xFFA2B58E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundclr,
      body: Center(child: Image.asset("assets/images/negative.png")),

    );
  }
}
