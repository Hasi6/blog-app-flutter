import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future SignIn(String email, String password) async {
    FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    print(user);
    return user.uid;
  }

  Future<String> SignUp(String username, String email, String password, BuildContext context) async {
    try {
      FirebaseUser user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
        Navigator.pushReplacementNamed(context, "/login");
        return user.uid;
    } catch (e) {
      print(e.message);
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
    await _auth.signOut();
  }
}
