import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mb_school/common/loading.dart';
import 'package:mb_school/config/config.dart';
import 'package:mb_school/config/function.dart';
import 'package:mb_school/screens/home/home.dart';
import 'package:mb_school/screens/signUpScreen.dart';
import 'package:page_transition/page_transition.dart';

import '../services/authentication.dart';
import '../widgets/texField.dart';


class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView(){
    setState((){
      _formKey.currentState?.reset();
      error ='';
      emailController.text = '';
      passwordController.text = '';
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Config.colors.bgfondu,
          ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                    child: Image.asset(Config.assets.logo_img),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          gradient:
                          LinearGradient(colors: [Config.colors.bgfondu, Config.colors.gbColor]),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 4,
                                spreadRadius: 3,
                                color: Colors.black12)
                          ],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(200),
                              bottomRight: Radius.circular(200))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10, left: 45),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                             Text(
                              'Let\'s',
                              style: TextStyle(
                                fontFamily: "roboto_bold",
                                  fontSize: 25,
                                  color: Config.colors.primaryTextColor,
                              ),
                            ),
                            const Text(
                              ' login',
                              style: TextStyle(
                                fontFamily: "roboto_bold",
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child: TField(controller: emailController, hintText: 'Email Adress', prefixIcon: const Icon(
                      Icons.alternate_email_outlined,
                      color: Colors.grey,
                      size: 22,
                    ),),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30)
                        .copyWith(bottom: 10),
                    child:
                    TextField(
                      controller: passwordController,
                      style: TextStyle(color: Config.colors.primaryTextColor, fontSize: 14.5),
                      obscureText: isPasswordVisible ? false : true,
                      decoration: InputDecoration(
                        filled: true,
                          fillColor: Config.colors.fieldTextColor,
                          prefixIconConstraints:
                          const BoxConstraints(minWidth: 45),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                            size: 22,
                          ),
                          suffixIconConstraints:
                          const BoxConstraints(minWidth: 45, maxWidth: 46),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                              size: 22,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: "roboto_bold",
                              color: Config.colors.tirthTextColor, fontSize: 14.5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(color: Config.colors.gbColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:  BorderSide(color: Config.colors.gbColor))),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // button login
                       dynamic result = await AuthenticateService()
                          .singIn(emailController.text, passwordController.text);
                       if(result == false){
                         setState((){
                           error = 'please supply a valid email';
                         });
                       } else { setState(() {
                         Navigator.pushReplacement(
                             context, PageTransition(
                             child: Home(),
                             type: PageTransitionType.rightToLeftWithFade));
                              });
                         }
                    },
                    child: Container(
                      height: 53,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.black12.withOpacity(.2),
                                offset: const Offset(2, 2))
                          ],
                          borderRadius: BorderRadius.circular(30),
                        color: Config.colors.gbColor,
                      ),
                      child: Text('Login',
                          style: TextStyle(
                            fontFamily: "roboto_bold",
                              color: Config.colors.secondTextColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text('Dons\'t have an account ?',
                      style: TextStyle(
                          fontFamily: "roboto_bold",
                          color: Config.colors.tirthTextColor,
                          fontSize: 13)),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateToNextpage(context, RegisterPage());
                      // Register page button
                    },
                    child: Container(
                      height: 53,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 120),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                      ),
                      child: Text('Sign Up',
                          style: TextStyle(
                            fontFamily: "roboto_bold",
                              color: Config.colors.gbColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),

        ),
      ),
    );
  }
}