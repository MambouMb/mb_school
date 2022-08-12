import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mb_school/config/config.dart';
import 'package:mb_school/screens/home/home.dart';
import 'package:mb_school/screens/home/homeScreens/search.dart';

import 'homeScreens/account.dart';
import 'homeScreens/featured.dart';
import 'homeScreens/homes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  void onTape(int page) {
    setState(() {
      page = currentIndex;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex == index;
          });
        },
        controller: pageController,
        children: const [
          HomeS(),
          Featured(),
          Search(),
          Account()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTape,
        backgroundColor: Config.colors.bgfondu,
        selectedLabelStyle: TextStyle(
            color: Config.colors.gbColor,
            fontFamily: 'boroto_bold',
            fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'boroto_bold',
            fontWeight: FontWeight.bold),
        selectedIconTheme: IconThemeData(color: Config.colors.gbColor),
        unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 20),
        iconSize: 24.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined), label: "Dashbord"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: "Profil"),
        ],
      ),
    );
  }
}