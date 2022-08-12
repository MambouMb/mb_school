import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mb_school/config/config.dart';
import 'package:mb_school/screens/login_screen.dart';
import 'package:mb_school/screens/presentationScreen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget{


  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{

  @override
  void initState(){
      Timer(
          const Duration(seconds: 3),
              () => Navigator.pushReplacement(
                  context, PageTransition(
                  child: const Presented(),
                  type: PageTransitionType.rightToLeftWithFade))
    );
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightSpace = MediaQuery.of(context).size.height;
    final widthSpace = MediaQuery.of(context).size.width*1.4;

    return Scaffold(
      body: Center(
        child: Container(
          height: heightSpace,
          width: widthSpace,
          decoration: BoxDecoration(color: Config.colors.gbColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Config.assets.splash_img, height: 200, width: 300),
            ],
          ),
        ),
      ),
    );
  }


}