/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String id;
  String displayName;
  String email;
  String photoURL;

  User({
    required this.id,
    required this.displayName,
    required this.photoURL,
    required this.email,
  });

  factory User.fromFirestore(DocumentSnapshot userDoc) {
    Map userData = userDoc.data;
    return User(
      id: userDoc.documentID,
      displayName: userData['displayName'],
      photoURL: userData['photoURL'],
      email: userData['email'],
    );
  }

  void setFromFirestore(DocumentSnapshot userDoc) {
    Map userData = userDoc.data;
    this.id = userDoc.documentID;
    this.displayName = userData['displayName'];
    this.photoURL = userData['photoURL'];
    this.email = userData['email'];
    notifyListeners();
  }
}*/
