import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserAlert {
  information(BuildContext context, String title, String message) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text(message)],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () => Navigator.pop(context)
              )
            ],
          );
        });
  }
}
