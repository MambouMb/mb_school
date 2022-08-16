import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mb_school/models/globalController.dart';

import '../../../config/config.dart';
import '../../../services/authentication.dart';


class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var esCollection = FirebaseFirestore.instance.collection('Enseignant').doc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colors.bgfondu,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 150,
                width: 400,
                child: Image.asset(Config.assets.profile),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 200.0,
                  width: 400.0,
                  child: Column(
                    children: [
                      Text('Mambou William', style: TextStyle(
                        color: Config.colors.gbColor,
                        fontSize: 18.0
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(EvaIcons.googleOutline, color: Colors.blue,),
                            Text(' exempleEmail@gmail.com', style: TextStyle(fontWeight: FontWeight.bold,
                            fontFamily: 'roboto_bold',
                            fontSize: 18.0),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text('Video preference',style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.userPen, color: Config.colors.gbColor,),
                title: Text('Edit Profile',
                    style: TextStyle(color: Config.colors.tirthTextColor,
                    fontSize: 20.0,
                    fontFamily: 'roboto_bold'),),
                trailing: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowRightLong, color: Config.colors.gbColor,),
                  onPressed: (){},),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.circleUser, color: Config.colors.gbColor,),
                title: Text('Personal Information',
                  style: TextStyle(color: Config.colors.tirthTextColor,
                      fontSize: 20.0,
                      fontFamily: 'roboto_bold'),),
                trailing: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowRightLong, color: Config.colors.gbColor,),
                  onPressed: (){},),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.unlockKeyhole, color: Config.colors.gbColor,),
                title: Text('Edit Password',
                  style: TextStyle(color: Config.colors.tirthTextColor,
                      fontSize: 20.0,
                      fontFamily: 'roboto_bold'),),
                trailing: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowRightLong, color: Config.colors.gbColor,),
                onPressed: (){},),
              ),
              MaterialButton(
                onPressed: () async {
                  await AuthenticateService().signOut();
                },
                child: ListTile(
                  leading: Icon(Icons.logout, color: Config.colors.gbColor,),
                  title: Text('Log Out',
                    style: TextStyle(color: Config.colors.tirthTextColor,
                        fontSize: 20.0,
                        fontFamily: 'roboto_bold'),),
                  trailing: Icon(FontAwesomeIcons.arrowRightLong, color: Config.colors.gbColor,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
