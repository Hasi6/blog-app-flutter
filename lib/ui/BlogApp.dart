import 'package:flutter/material.dart';
import 'package:my_stackoverflow/ui/LoginPage.dart';
import 'package:my_stackoverflow/ui/RegisterPage.dart';

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Blog App",
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => LoginPage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/register': (context) => RegisterPage(),
    },
    );
  }
}
