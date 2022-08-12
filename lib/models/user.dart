import 'package:firebase_auth/firebase_auth.dart';

class UserApp{
  final String uid;

  UserApp({required this.uid});
}


class ETUserData{
  late final String uid;
  late final String fullname;
  late final String email;
  late final String location;
  late final String sexe;
  late final String tel;
  late final String profilPict;
  late final String categorie;

  ETUserData(
      {
        required this.uid,
        required this.fullname,
        required this.email,
        required this.location,
        required this.sexe,
        required this.tel,
        required this.profilPict,
        required this.categorie});

  /*ETUser.fromJson(Map<String, dynamic> json){
    uid = json['uid'];
    fullname = json['fullname'];
    email = json['email'];
    location = json['localisation'];
    sexe = json['sexe'];
    tel = json['tel'];
    image = json['image'];

  }

  Map<String, dynamic> toJson(){
    return {"uid": uid, "fullname": fullname,
      "email": email, "location": location,
      "sexe": sexe, "tel" : tel};
  }*/

}


class AppUser{
  final String uid;
  AppUser(this.uid);}

class ESUser{
  late final String? uid;
  late final String? fullname;
  late final String? email;
  late final String? qualification;
  late final String? acountNumber;
  late final String? tel;

  ESUser(
      {this.uid,
        this.fullname,
        this.email,
        this.qualification,
        this.acountNumber,
        this.tel});

  ESUser.fromJson(Map<String, dynamic> json){
    uid = json['uid'];
    fullname = json['fullname'];
    email = json['email'];
    qualification = json['localisation'];
    acountNumber = json['sexe'];
    tel = json['tel'];

  }

  Map<String, dynamic> toJson(){
    return {"uid": uid, "fullname": fullname,
      "email": email, "Qualification": qualification,
      "acountNumber": acountNumber, "tel" : tel};
  }
}