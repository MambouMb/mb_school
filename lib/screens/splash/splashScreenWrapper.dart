import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mb_school/config/config.dart';
import 'package:mb_school/config/function.dart';
import 'package:mb_school/screens/home/home.dart';
import 'package:mb_school/screens/login_screen.dart';
import 'package:mb_school/screens/presentationScreen.dart';

class SplashScreenWra extends StatefulWidget{


  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreenWra>{

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 5), (){
      var authUser =
      FirebaseAuth.instance.currentUser?.uid;
      if(authUser == null){
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => false);
      }else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => Home()),
                (route) => false);
      }
    });
  }

  starTimer()  async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, loginRoute);
  }

  loginRoute() {
    navigateToNextpage(context, const LoginPage());
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