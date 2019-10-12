import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  

  validateAndSave(){

  }

  moveToRegister(){

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog App"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createInputs() + createBtns()
          ),
        ),
      ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(height: 10.0,),
      logo(),
      SizedBox(height: 10.0,),
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
      ),
      SizedBox(height: 10.0,),
      TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        
      ),
      SizedBox(height: 20.0,),
    ];
  }

  Widget logo(){
    return Image.asset(
              'images/1.gif');
  }

  List<Widget> createBtns() {
    return [
      RaisedButton(
        child: Text("Login", style: TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.red,
        onPressed: ()=>validateAndSave(),
      ),
      FlatButton(
        child: Text("Don't have an Account? Register Here", style: TextStyle(fontSize: 14.0)),
        textColor: Colors.white,
        color: Colors.transparent,
        onPressed: ()=>Navigator.pushReplacementNamed(context, '/register'),
      )
    ];
  }
}
