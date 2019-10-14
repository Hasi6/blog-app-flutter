import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_stackoverflow/auth/Auth.dart';
import 'package:my_stackoverflow/posts/Posts.dart';
import 'package:my_stackoverflow/ui/PostsUi.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Posts> postsList = [];

  @override
  void initState() {
    super.initState();

    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child('Posts');

    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      postsList.clear();

      for (var key in KEYS) {
        Posts posts = Posts(
          DATA[key]['image'],
          DATA[key]['description'],
          DATA[key]['date'],
          DATA[key]['time'],
        );
        postsList.add(posts);
      }
      setState(() {

      });
    });
  }

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
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
          centerTitle: true,
        ),
        body: Container(
            child: postsList.length == 0
                ? Text("No Posts Available")
                : ListView.builder(
                    itemCount: postsList.length,
                    itemBuilder: (_, index) {
                      return PostsUi(
                          postsList[index].image,
                          postsList[index].description,
                          postsList[index].date,
                          postsList[index].time);
                    },
                  )),
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
                  onPressed: () => Navigator.pushNamed(context, "/upload"),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
