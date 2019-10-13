import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:my_stackoverflow/auth/Auth.dart';

class LoginPage extends StatefulWidget {

  LoginPage();

  _LoginPageState createState() => _LoginPageState();

  
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";

  final formKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog App"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: KeyboardAvoider(
        autoScroll: true,
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createInputs() + createBtns()),
          ),
        ),
      ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(
        height: 10.0,
      ),
      logo(),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email is Required' : null,
        onSaved: (value) => _email = value,
      ),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password is Required' : null,
        onSaved: (value) => _password = value,
      ),
      SizedBox(
        height: 20.0,
      ),
    ];
  }

  Widget logo() {
    return Image.network(
      'https://firebasestorage.googleapis.com/v0/b/twitter-clone-by-hasi.appspot.com/o/app_logo%2F9a4a63e9-ef14-4cf9-bbea-040a53033945_200x200.png?alt=media&token=41e404e9-0986-4a0a-b80f-f5d4d7507424',
      width: 180.0,
      height: 180.0,
    );
  }

  List<Widget> createBtns() {
    return [
      RaisedButton(
        child: Text("Login", style: TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.red,
        onPressed: () => validateAndSave(),
      ),
      FlatButton(
        child: Text("Don't have an Account? Register Here",
            style: TextStyle(fontSize: 14.0)),
        textColor: Colors.white,
        color: Colors.transparent,
        onPressed: () => Navigator.pushReplacementNamed(context, '/register'),
      )
    ];
  }
}
