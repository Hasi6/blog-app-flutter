import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class ImageUpload extends StatefulWidget {
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File sampleImage;
  String description;
  String imageUrl;
  double percentage = 0;
  final formKey = GlobalKey<FormState>();

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;
    });
  }

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  upload() async {
    if (validateAndSave()) {
      final StorageReference postImageEndPoint =
          FirebaseStorage.instance.ref().child("post_images");
      var timeKey = DateTime.now();

      final StorageUploadTask uploadTask = postImageEndPoint
          .child('${timeKey.toString()}.jpg')
          .putFile(sampleImage);

      var downloadUrl =await (await uploadTask.onComplete).ref.getDownloadURL();
        var imageUrl = downloadUrl.toString();

      saveToDatabase(imageUrl, timeKey);
    }
  }

  saveToDatabase(url, timeKey) async {
    var date = DateFormat('MMM d, yyyy');
    var time = DateFormat('EEEE, hh:mm aaa');

    String dateToDb = date.format(timeKey);
    String timeToDb = time.format(timeKey);

    DatabaseReference dataRef = FirebaseDatabase.instance.reference();

    var data = {
      "image": url,
      "description": description,
      "date": dateToDb,
      "time": timeToDb
    };

    dataRef.child("Posts").push().set(data);
    Navigator.pushReplacementNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upload Post"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: sampleImage == null ? Text("Select An Image") : enableUpload(),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: getImage,
            tooltip: "Add Image",
            child: Icon(Icons.add_a_photo)),
      ),
    );
  }

  Widget enableUpload() {
    return KeyboardAvoider(
      autoScroll: true,
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Image.file(
              sampleImage,
              height: 330.0,
              width: 660.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                return value.isEmpty ? 'Post Description is Required' : null;
              },
              onSaved: (value) {
                return description = value;
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              elevation: 10.0,
              child: Text("Add Post"),
              textColor: Colors.black,
              color: Colors.red,
              onPressed: () => upload(),
            )
          ],
        ),
      ),
    );
  }
}
