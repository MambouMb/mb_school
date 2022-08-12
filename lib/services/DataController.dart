import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/cours.dart';

class DataController extends GetxController{

  List<Object> _coursList = [];

  Future getData(String collection) async {
    QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection(collection).get();
    return snapshot.docs;
  }

  Future getCoursList(String collection) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(collection)
        .get();
    return snapshot.docs;

    //_coursList = List.from(snapshot.docs.map((doc) => CoursData.fromSnapshot(doc)));

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}