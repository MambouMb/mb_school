import 'package:flutter/material.dart';
import 'package:mb_school/widgets/texField.dart';

import '../../models/globalController.dart';

class Page1 extends StatelessWidget{
  bool isPasswordVisible = true;


  Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          TProgress(
            controller: emailController,
              hintText: "Email Address",
              prefix: const Icon(Icons.alternate_email_outlined)),
          const SizedBox(height: 15),

          TProgress(
            controller: passController,
            hintText: 'Password',
            prefix: const Icon(
              Icons.lock,
              size: 22,
            ),
          ),
          const SizedBox(height: 15),

          TProgress(
            controller: confirmPassController,
              hintText: 'Confirm Password',
              prefix: const Icon(
                Icons.lock,
                size: 22,
              ),
             ),
        ],

      ),
    );
  }
}