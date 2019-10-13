import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_stackoverflow/ui/UserAlert.dart';

class Auth {

  var _dialog = UserAlert();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future SignIn(String email, String password, BuildContext context) async {
    try {
        FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
        Navigator.pushReplacementNamed(context, "/");
    print(user);
    return user.uid;
    } catch (e) {
      _dialog.information(context, "Login Error", e.message);
    }
  }

  Future<String> SignUp(String username, String email, String password, BuildContext context) async {
    try {
      FirebaseUser user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
        Navigator.pushReplacementNamed(context, "/");
        return user.uid;
    } catch (e) {
     _dialog.information(context, "Register Error", e.message);
    }
    
    
  }

  Future<String> CheckAuthState() async {
    FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      return user.uid;
    } else {
      return null;
    }
  }

  Future SignOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.message);
    }
  }
}
