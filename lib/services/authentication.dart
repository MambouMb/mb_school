import 'package:firebase_auth/firebase_auth.dart';
import 'package:mb_school/models/user.dart';
import 'package:mb_school/services/database.dart';


class AuthenticateService {
  final FirebaseAuth _auth = FirebaseAuth.instance;



// Connecter un utilisateur
  singIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password);
    } on FirebaseException catch (e) {}
  }







  UserApp? _userFromFirebaseUser(User? user) {
    return user != null ? UserApp(uid: user.uid) : null;
  }

  Stream<UserApp?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Stream<User?> get onChangeUser => _auth.authStateChanges();


  // Deconnecter un utilisateur
  signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {}
  }
}