import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class RegisterPage extends StatefulWidget {
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isEnabled = false;
  bool _isMatched = null;

  String _username = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  final formKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formKey.currentState;
    var passwordIsMatched = _checkPasswordAreMatched();

    if(passwordIsMatched){
      setState(() {
       _isMatched =  false;
      });
    }else{
      setState(() {
       _isMatched = true; 
      });
    }

    if (form.validate()) {
      form.save();
      return true;
    } else if (_password != _confirmPassword) {
      return false;
    }
    return false;
  }

  bool _checkPasswordAreMatched() {
    if (_password == _confirmPassword) {
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
        decoration: InputDecoration(labelText: 'Username'),
        validator: (value) => value.isEmpty ? 'Username is Required' : null,
        onSaved: (value) => _username = value,
        // onChanged: (e) => _onChanged(e, _isEnabled),
      ),
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
        validator: (value) => value.isEmpty ? 'Password is Required' : null,
        onSaved: (value) => _password = value,
      ),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Confirm Password'),
        validator: (value) =>
            value.isEmpty ? 'Confirm Password is Required' : null,
        onSaved: (value) => _confirmPassword = value,
      ),
      SizedBox(
        height: 20.0,
      ),
      Text(
          _isMatched == false
              ? "Password and Confirm Password Did not Matched"
              : "",
          style: TextStyle(color: Colors.redAccent)),
      SizedBox(
        height: 20.0,
      )
    ];
  }

  Widget logo() {
    return Image.asset(
      'images/1.gif',
      width: 80.0,
      height: 80.0,
    );
  }

  List<Widget> createBtns() {
    return [
      RaisedButton(
        child: Text("Register", style: TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.red,
        onPressed: () => validateAndSave(),
      ),
      FlatButton(
        child: Text("Already Registerd? Login Here",
            style: TextStyle(fontSize: 14.0)),
        textColor: Colors.white,
        color: Colors.transparent,
        onPressed: () => Navigator.pushReplacementNamed(context, '/'),
      )
    ];
  }
}
