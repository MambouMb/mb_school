import 'dart:ui';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class Storage{

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> uploadFile(
    String filepath,
    String fileName,

  ) async {
    final String currentuid = _auth.currentUser as String;
    File file = File(filepath);

    try{
      final upres = await storage.ref().child(fileName).child(_auth.currentUser!.uid);

      UploadTask uploadTask = upres.putFile(file);

      TaskSnapshot snap = await uploadTask;

      String downloadUrl = await snap.ref.getDownloadURL();
      //await storage.ref('userPict/$currentuid+$fileName').putFile(file);
    } on firebase_storage.FirebaseException catch(e) {
      if (kDebugMode) {
        print(e);
      }
    }
}

  Future<firebase_storage.ListResult> listfiles() async {
    firebase_storage.ListResult result = 
      await storage.ref('userPict').listAll();
    for (var ref in result.items) {
      print('Found file: $ref');
    }
    return result;
  }

  Future<String> downloadUrl (String imageName) async {
    String downloadUrl = (await storage.ref('userPict/$imageName').getDownloadURL()
    );
    return downloadUrl;
  }

}