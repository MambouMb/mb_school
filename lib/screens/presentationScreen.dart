import 'package:flutter/material.dart';
import 'package:mb_school/config/function.dart';
import 'package:mb_school/screens/splashScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../config/config.dart';
import 'login_screen.dart';

class Presented extends StatefulWidget {
  const Presented({Key? key}) : super(key: key);


  @override
  State<Presented> createState() => _PresentedState();
}

class _PresentedState extends State<Presented> {

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    PageView _pageview = PageView(
      controller: _pageController,
      children: [
        _page(
            Image.asset(Config.assets.vec_etu),
            "Make Leaning Accessible Anywhere",
            "read your courses with peace of mindEnjoy your classes with peace of mind ..."),
        _page(Image.asset(Config.assets.vec_ensi),
            "Empower your learning Experience",
            "put Put and make your know edge available to others...")],
    );
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Config.colors.bgfondu),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  child: Image.asset(Config.assets.logo_img),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 500,
                  child: Stack(
                    children: [_pageview],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 2,
                        effect: const WormEffect(),
                        onDotClicked: (index) => _pageController.animateToPage(
                            index,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.bounceOut),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    navigateToNextpage(context, const LoginPage());
                  },
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Config.colors.primaryTextColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text('NEXT',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
  Widget _page(Image image, String slog1, String slog2){
    return Container(
      child: Center(
        child: Column(
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              SizedBox(
              height: 250,
              child: image,
            ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 55,
                width: 300,
                child: Text(slog1,
                  style: const TextStyle(fontSize: 23,
                  fontFamily: "roboto_black", ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 55,
                width: 320,
                child: Text(slog2,
                style: const TextStyle(fontSize: 16,
                fontFamily: "roboto_Light" ),
                textAlign: TextAlign.center,
              ),
            ),
            ]
        ),
    ),);
  }



}