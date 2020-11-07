import 'package:flutter/material.dart';
import 'package:meno_app/src/routes/slide_from_right_page_route.dart';
import 'package:meno_app/src/screens/homescreen.dart';

class PositiveEmotion extends StatelessWidget {
  Color backgroundclr = Color(0xFFA2B58E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundclr,
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(child: Image.asset("assets/images/negative.png")),
            Container(
              alignment: Alignment.bottomCenter,
              child: ClipOval(
                child: Material(
                  color: Colors.white70, // button color
                  child: InkWell(
                    splashColor: backgroundclr, // inkwell color
                    child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 50,
                        )),
                    onTap: () {
                      Navigator.push(
                        context,
                        SlideFromRightPageRoute(widget: HomeScreen()),
                      );
                    },
                  ),
                ),
              ),
              height: 50,
              width: 50,
            )
          ],
        ));
  }
}
