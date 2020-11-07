import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:meno_app/src/routes/slide_from_right_page_route.dart';
import 'package:meno_app/src/screens/positive.dart';

class EmotionPage extends StatefulWidget {
  @override
  _EmotionPageState createState() => _EmotionPageState();
}

class _EmotionPageState extends State<EmotionPage> {
  String feel = "Normal";
  double _value = 0.0;
  double lastsection = 0.0;
  String feedbacktxt = "Normal";
  Color backgroundclr = Color(0xFFA2B58E);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundclr,
        body: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              "How are you feeling now",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 400,
                    height: 600,
                    child: Image.asset('assets/images/Rectangle.png'),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 40,
                    child: Container(
                      width: 300,
                      height: 600,
                      child: FlareActor(
                        'assets/flares/emotions.flr',
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        animation: feel,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 140,
                    right: 65,
                    width: 250,
                    child: Slider(
                      min: -50.0,
                      max: 50.0,
                      value: _value,
                      divisions: 100,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      onChanged: (val) {
                        setState(() {
                          _value = val;
                        });
                        if (_value == 0.0) {
                          if (lastsection > 0.0) {
                            setState(() {
                              feel = "Positive";
                            });
                          }
                          setState(() {
                            lastsection = 0.0;
                            feedbacktxt = "Happy";
                          });
                        } else if (_value > 0.0 && _value < 50.0) {
                          if (lastsection == 0.0) {
                            setState(() {
                              feel = "Positive";
                            });
                          } else if (lastsection == 50.0) {
                            setState(() {
                              feel = "Positive";
                            });
                          }
                          setState(() {
                            lastsection = 50.0;
                            feedbacktxt = "Sad";
                          });
                        } else if (_value >= -50.0 && _value < 0.0) {
                          if (lastsection == 0.0) {
                            setState(() {
                              feel = "Minus";
                            });
                          } else if (lastsection == -50.0) {
                            setState(() {
                              feel = "Minus";
                            });
                          }
                          setState(() {
                            lastsection = -50.0;
                            feedbacktxt = "Sad";
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
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
                            widget: PositiveEmotion(),
                          ));
                    },
                  ),
                ),
              ),
              height: 50,
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}
