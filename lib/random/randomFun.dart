import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


/*foo() async {
  Map<String, dynamic> myData;

  await carCollectionRef
      .get()
      .then((snapshot) => snapshot.docs.forEach((element) {
    if (element.exists) {
      carCollectionRef
          .doc(element.id)
          .collection('USER_CAR_COLLECTION')
          .get()
          .then((snapshot2) => snapshot2.docs.forEach((element2) {
        if (element2.exists) {
          carCollectionRef
              .doc(element.id)
              .collection('USER_CAR_COLLECTION')
              .doc(element2.id)
              .collection('MODEL_COLLECTION')
              .doc('1004')
              .get()
              .then((value) => {
            if (value.exists) {myData = value.data()}
          });
        }
      }));
    }
  }));

  print(myData);


  FirebaseFirestore.instance.collectionGroup('moodels').where('docId', isEqualTo: '1004').get()
      .then((QuerySnapshot querySnapshot) => {...});
}

*/