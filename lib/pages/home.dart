import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference items = FirebaseFirestore.instance.collection('items');

  Future<void> addItems() {
    // Call the user's CollectionReference to add a new user
    return items
        .add({
          'name': 'Item ${DateTime.now()}',
        })
        .then((value) => print("Item Added"))
        .catchError((error) => print("Failed to add Item: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            RaisedButton(
              child: Text('NEW ITEM'),
              onPressed: () {
                final litUser = context.getSignedInUser();
                litUser.when(
                  (user) => print(user.uid),
                  empty: () {},
                  initializing: () {},
                );
                addItems().then((value) {});
              },
            ),
            RaisedButton(
              child: Text('Sign out'),
              onPressed: () {
                context.signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
