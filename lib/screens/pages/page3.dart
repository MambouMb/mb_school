
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mb_school/config/function.dart';
import 'package:mb_school/services/storage_service.dart';
import '../../config/config.dart';
import '../../models/globalController.dart';
import '../../services/storageMethods.dart';
import '../../widgets/progress_popup.dart';
import '../../widgets/texField.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../home/home.dart';


class Page3 extends StatefulWidget{
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3();
}

class _Page3 extends State<Page3>{
  final Storage storage = Storage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference<Map<String, dynamic>> userCollection =
  FirebaseFirestore.instance.collection("users");


  Future pickImages() async {
    try{
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery);

      if(image == null){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No file selected'),
            )
        );
      }

      final imageTemporary = File(image!.path);
      final path = image.path;
      final fileName = image.name;


      if (kDebugMode) {
        print(path);
      }
      if (kDebugMode) {
        print(fileName);
      }
      setState(() => imageProfil = imageTemporary);
    } on PlatformException catch(e) {
      print('failer to pick image : $e');
    }
  }



  _photoProfilFun() {
    

    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 250,
                child: imageProfil != null
                    ? Image.file(imageProfil!, fit: BoxFit.cover)
                    : const FlutterLogo(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                ),
                child: IconButton(
                    onPressed: pickImages,
                    icon: Icon(Icons.add_a_photo, color: Config.colors.gbColor,),
                tooltip: "add image",),
              ),
            ],
          )
        ],
      ),
    );
  }

  validateForm() {
    if(fullnameController.text.length < 3){
      Fluttertoast.showToast(msg: "the full name must contain 3 characters");
    } else if(phoneController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Required phone number");
    } else if(!emailController.text.contains("@")){
      Fluttertoast.showToast(msg: "Invalid address mail");
    } else if(passController.text.length < 5 ){
      Fluttertoast.showToast(msg: "A password must contain 6 characters");
    } else if (confirmPassController.text != passController.text){
      Fluttertoast.showToast(msg: "An password don't match");
    } else {
      saveUserInfo();
    }
  }


  saveUserInfo() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressPopUp("Traitement en cours. Veuillez patienter...");
        });

    final User? firebaseUser = (await _auth
        .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim())
        .catchError((msg) {
      Navigator.pop(context);
      if (msg.hashCode == "firebase_auth/email-already-in-use") {
        Fluttertoast.showToast(msg: "error email");
      }
      Fluttertoast.showToast(msg: "Error $msg");
    }))
        .user;

    String photoProfilUrl = await StorageMethods()
        .uploadImageToStorage("photoProfil", imageProfil!, false);

    if (firebaseUser != null) {
      // Map userMap = ;


      userCollection.doc(firebaseUser.uid).set({
        "uid" : firebaseUser.uid.trim(),
        "fullName": fullnameController.text.trim(),
        "email": emailController.text.trim(),
        "location": locationController.text.trim(),
        "sexe": sexController.text.trim(),
        "phone": phoneController.text.trim(),
        "photo": photoProfilUrl.trim(),
        "categorie": "Student"
      })
      ;


      currentUser = firebaseUser;
      Fluttertoast.showToast(msg: "Compte a été créé");

      navigateToNextpage(context, Home());


    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Compte n'a pas été créé");
    }
  }



  @override
  Widget build(BuildContext context){

    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          _photoProfilFun(),
          const SizedBox(height: 10),
          SizedBox(
            height: 20,
            child: Text("Add Profile picture",
              style: TextStyle(color: Config.colors.gbColor,
                  fontSize: 15,
                  fontFamily: "roboto_bold",
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(height: 15),
          TProgress(
            controller: fullnameController,
            hintText: 'Full Name',
            prefix: const Icon(
              Icons.person,
              size: 22,
            ),
          ),
          const SizedBox(height: 20),

          GestureDetector(
            onTap: () {
              validateForm();
            },
            child: Container(
              height: 53,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 100),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Config.colors.primaryTextColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Text('Register',
                  style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}



