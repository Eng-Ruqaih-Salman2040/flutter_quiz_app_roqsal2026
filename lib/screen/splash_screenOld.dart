import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/animation/fade_animation.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_screen.dart';
import 'package:roqsal_quizapp_2026/util/constant.dart';
import 'package:roqsal_quizapp_2026/util/router_path.dart';

class SplashPage extends StatefulWidget {


  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void startTimer(){
    Timer(Duration(seconds: 1), (){
     // Navigator.of(context).pushReplacementNamed(DashBoardScreen);
      Navigator.of(context).pushReplacementNamed(IntroScreen);

    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kItemSelectBottomNav
        ),
        child: FadeAnimation(0.5,
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Quiz ",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Knowledge ",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
