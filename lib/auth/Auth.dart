import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  Future<String> SignUp(String username, String email, String password,
      BuildContext context) async {
    try {
      FirebaseUser user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      saveUserInDatabase(user.uid, username, email);
      Navigator.pushReplacementNamed(context, "/");
    } catch (e) {
      _dialog.information(context, "Register Error", e.message);
    }
  }

  saveUserInDatabase(uid, username, email) async {
    DatabaseReference usersRef = FirebaseDatabase.instance.reference();
    var data = {
      "uid": uid,
      "username": username,
      "email": email,
      "image":
          'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png'
    };

    usersRef.child("User").push().set(data);
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
