import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_stackoverflow/auth/Auth.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  var auth = Auth();
  _HomePageState() {
    checkUserState();
  }

  checkUserState() async {
    var user = await auth.CheckAuthState();

    if (user == null) {
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  _logOut() {
    auth.SignOut();
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: Text("Loading"),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
          centerTitle: true,
        ),
        body: Container(
          child: Text("Hasi"),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.red,
          child: Container(
            margin: const EdgeInsets.only(left: 70.0, right: 70.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 40.0,
                  color: Colors.white,
                  onPressed: () => _logOut(),
                ),
                IconButton(
                  icon: Icon(Icons.add_a_photo),
                  iconSize: 40.0,
                  color: Colors.white,
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, "/register"),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
