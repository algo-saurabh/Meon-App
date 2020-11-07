import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meno_app/src/routes/slide_from_right_page_route.dart';
import 'package:meno_app/src/screens/helloFemale.dart';
import 'package:meno_app/src/screens/helloMale.dart';

class ChooseGenderScreen extends StatelessWidget {
  Color backgroundclr = Color(0xFFA2B58E);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundclr,
      body: Padding(
        padding: EdgeInsets.only(top: 200.0,bottom: 5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.white30,
                width: 350,
                height: 60,
                child: Center(
                  child: Text(
                      'I am...',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 55.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        SlideFromRightPageRoute(
                          widget: HelloMale(),
                        ),
                      );
                    },
                    child: Container(
                        width: 200,
                        height: 250,
                        child: Image.asset('assets/images/big_male.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        SlideFromRightPageRoute(
                          widget: HelloFemale(),
                        ),
                      );
                    },
                    child: Container(
                        width: 200,
                        height: 250,
                        child: Image.asset('assets/images/big_female.png'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
