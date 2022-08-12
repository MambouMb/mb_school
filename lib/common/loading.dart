import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.blue.withOpacity(20.0),
      child: const Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}