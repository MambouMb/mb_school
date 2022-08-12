import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mb_school/models/cours.dart';
import 'package:mb_school/screens/home/user_list.dart';
import 'package:mb_school/screens/login_screen.dart';
import 'package:mb_school/services/authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../common/loading.dart';
import '../../models/user.dart';
import '../../services/database.dart';
import '../../widgets/cards/coursListCard.dart';

class Home extends StatelessWidget{
  final AuthenticateService _auth = AuthenticateService();

@override
Widget build(BuildContext context) {
  return StreamProvider<List<CoursData>>.value(
    initialData: [],
    value: null,
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        title: Text('Water Social'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text('logout', style: const TextStyle(color: Colors.white)),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: CoursList(),
    ),
  );
}
}