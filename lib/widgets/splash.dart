
import 'dart:async';
import 'package:flutter/material.dart';
import '../config/function.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget ({Key? key, this.time = 3, required this.child, required this.nextPage}) : super(key: key);
  final int time;
  final Widget child, nextPage;


  @override
  Widget build(BuildContext context) {
    Timer(Duration (seconds: time), () {
      route(context, nextPage, close: true);

    });
    return child;
  }

}