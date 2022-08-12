import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mb_school/config/config.dart';
import 'package:mb_school/widgets/cards/CategCard.dart';
import 'package:mb_school/widgets/cards/coursListCard.dart';
import 'package:mb_school/screens/home/home.dart';
import 'package:mb_school/screens/home/homeScreens/homes.dart';
import 'package:mb_school/screens/home/homeTest.dart';
import 'package:mb_school/screens/home/user_list.dart';
import 'package:mb_school/screens/splashScreen.dart';
import 'package:mb_school/screens/tests/uploadPage.dart';
import 'package:mb_school/screens/tests/testJustPickImage.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

    //FlutterNativeSplash.remove();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final bool splash = true;


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MB SCHOOL',
        theme: ThemeData(
          fontFamily: "roboto",
          primaryColor: Config.colors.primaryColor,
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen()

      /*StreamBuilder(
          stream: AuthenticateService().onChangeUser,
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.data == null ? SplashScreen() : Home();
          },
        );*/

    );

  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong!"),
          );
        } else if (snapshot.hasData) {
          return Home();
        } else {
          return HomeS();
        }
      },
    ),
  );
}


/*
return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "roboto",
          primaryColor: Config.colors.primaryColor,
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
        stream: AuthenticateService().onChangeUser,
              builder: (context, AsyncSnapshot snapshot) {
              return snapshot.data == null ? SplashWidget(nextPage: const Presented(),
                  time: 5,
                  child: SplashScreen(),
              ) : Home();
              },
        )
    );
 */
