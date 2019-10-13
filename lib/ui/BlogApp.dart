import 'package:flutter/material.dart';
import 'package:my_stackoverflow/ui/HomePage.dart';
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
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
}
}