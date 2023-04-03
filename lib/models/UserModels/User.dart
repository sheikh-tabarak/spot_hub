// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _db = FirebaseFirestore.instance;

class User {
  final bool IsBussiness;
  final String image;
  final String username;
  final String password;
  final String email;
  final String PhoneNo;
  final String Intrests;

  const User({
    required this.IsBussiness,
    required this.image,
    required this.username,
    required this.password,
    required this.email,
    required this.PhoneNo,
    required this.Intrests,
  });

  Map<String, dynamic> toJson() => {
        'IsBussiness': IsBussiness,
        'image': image,
        'username': username,
        'password': password,
        'email': email,
        'PhoneNo': PhoneNo,
        'Intrests': Intrests,
      };

  factory User.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return User(
        IsBussiness: data["IsBussiness"],
        image:data["image"],
        username: data["username"],
        password: data["password"],
        email: data["email"],
        PhoneNo:data["PhoneNo"],
        Intrests:data["Intrests"],);
  }
}

Future RegisterNewUser(String imagelink, String Username, String Password,
    String Email, String Phone) async {
  final Register = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final NewUser = User(
      IsBussiness: false,
      image: imagelink,
      username: Username,
      email: Email,
      password: Password,
      PhoneNo: Phone,
      Intrests: '');

  final json = NewUser.toJson();
  await Register.set(json);
}


// Future <User> getUser() async{

//   final snapshot = _db.collection("user").where(User)

//   User.fromSnapshot(document)

// }
