// import 'package:flutter/material.dart';
// import 'package:my_stackoverflow/auth/Auth.dart';
// import 'package:my_stackoverflow/ui/LoginPage.dart';

// class Mapping extends StatefulWidget {
//   final AuthImplementation auth;

//   Mapping(this.auth);
//   _MappingState createState() => _MappingState();
// }

// enum AuthStatus { notSingedIn, signedIn }

// class _MappingState extends State<Mapping> {

//   AuthStatus authStatus = AuthStatus.notSingedIn;

//   @override
//   void initState() {
//     super.initState();
//     widget.auth.CheckAuthState().then((userId){
//       setState(() {
//        authStatus = userId == null ? AuthStatus.notSingedIn : AuthStatus.signedIn;
//       });
//     });
//   }

//   _signedIn(){
//     setState(() {
//       authStatus = AuthStatus.signedIn;
//     });
//   }

//   _signedOut(){
//     setState(() {
//       authStatus = AuthStatus.notSingedIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     switch(authStatus){
//       case AuthStatus.notSingedIn: return LoginPage(
//         auth: widget.auth,
//         onSignedIn: _signedIn
//       );
//     }
//   }
// }
