import 'package:flutter/material.dart';
import 'package:meno_app/src/routes/slide_from_right_page_route.dart';
import 'package:meno_app/src/screens/intro.dart';

class HelloMale extends StatelessWidget {
  Color backgroundclr = Color(0xFFA2B58E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundclr,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Hello',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textScaleFactor: 4.0,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Chirag',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 44.0,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Stack(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/big_male.png")),
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
                          SlideFromRightPageRoute(
                            widget: OnBoardingPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                height: 425,
                width: 500,
              )
            ],
          )
        ],
      ),
    );
  }
}
