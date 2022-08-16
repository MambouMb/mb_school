import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mb_school/models/globalController.dart';
import 'package:mb_school/models/user.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/cours.dart';



class DBService {
  late final String uid;
  DBService(this.uid);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference<Map<String, dynamic>> userCol =
  FirebaseFirestore.instance.collection("users");

  final CollectionReference<Map<String, dynamic>> coursCol =
  FirebaseFirestore.instance.collection("cours");

  var esCollection = FirebaseFirestore.instance.collection('Enseignant');
  var coursCollection = FirebaseFirestore.instance.collection('cours');
  final referenceDatabase = FirebaseDatabase.instance;





  ETUserData _userFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return ETUserData(
      uid: uid,
      fullname: data['fullname'],
      email: data['email'],
      sexe: data['sexe'],
      location: data['location'],
      tel: data['phone'],
      profilPict: data['photo'],
      categorie: data['categorie']
    );
  }

  CoursData _coursFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("cours not found");
    return CoursData(
        cTitle: data['titre'],
        description: data['description'],
        categorie: data['categorie'],
        author: data['author'],
        vignette: data['Cphoto'],
        rating: data['rating']
    );
  }

  List<CoursData> _coursListFromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _coursFromSnapshot(doc);
    }).toList();
  }

  Stream<List<CoursData>> get cours {
    return coursCol.snapshots().map(_coursListFromSnapshot);
  }


  List<ETUserData> _userListFromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _userFromSnapshot(doc);
    }).toList();
  }






}