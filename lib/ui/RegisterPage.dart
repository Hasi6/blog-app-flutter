import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class RegisterPage extends StatefulWidget {
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool _isEnabled = false;

  String _username = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  validateAndSave(){

  }

  moveToRegister(){

  }

  _onChanged(e, name){
    setState(() {
          name= true;
        });
        print(_isEnabled);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createInputs() + createBtns()
          ),
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
        decoration: InputDecoration(labelText: 'Username'),
        onChanged: (e) => _onChanged(e, _isEnabled),
      ),
      SizedBox(height: 10.0,),
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
      ),
      SizedBox(height: 10.0,),
      TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
      ),
      SizedBox(height: 10.0,),
      TextFormField(
        decoration: InputDecoration(labelText: 'Confirm Password'),
        
      ),
      SizedBox(height: 20.0,),
    ];
  }

  Widget logo(){
    return Image.asset(
              'images/1.gif', width: 80.0,height: 80.0,);
  }

  List<Widget> createBtns() {
    return [
      RaisedButton(
        child: Text("Register", style: TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.red,
        onPressed: _isEnabled ? ()=>validateAndSave() : null,
      ),
      FlatButton(
        child: Text("Already Registerd? Login Here", style: TextStyle(fontSize: 14.0)),
        textColor: Colors.white,
        color: Colors.transparent,
        onPressed: ()=>Navigator.pushReplacementNamed(context, '/'),
      )
    ];
  }
}
