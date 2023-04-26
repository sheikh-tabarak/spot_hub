// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _db = FirebaseFirestore.instance;

class UserClass {
  final bool IsBussiness;
  final String image;
  final String username;
  final String password;
  final String email;
  final String PhoneNo;
  final String Address;
  final String Intrests;

  const UserClass({
    required this.IsBussiness,
    required this.image,
    required this.username,
    required this.password,
    required this.email,
    required this.PhoneNo,
    required this.Address,
    required this.Intrests,
  });

  Map<String, dynamic> toJson() => {
        'IsBussiness': IsBussiness,
        'image': image,
        'username': username,
        'password': password,
        'email': email,
        'PhoneNo': PhoneNo,
         "Address": Address,
        'Intrests': Intrests,
      };

  factory UserClass.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserClass(
      IsBussiness: data["IsBussiness"],
      image: data["image"],
      username: data["username"],
      password: data["password"],
      email: data["email"],
      PhoneNo: data["PhoneNo"],
       Address: data["Address"],
      Intrests: data["Intrests"],
    );
  }
}

Future<UserClass> getUserData() async {
  DocumentSnapshot ds = await _db
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();
  String Email = ds.get('email');

  UserClass U = UserClass(
      IsBussiness: ds.get('IsBussiness'),
      image: ds.get('image'),
      username: ds.get('username'),
      password: ds.get('password'),
      email: ds.get('email'),
      PhoneNo: ds.get('PhoneNo'),
       Address: ds.get('Address'),
      Intrests: ds.get('Intrests'),
      );
  print(Email);

  return U;
}

Future RegisterNewUser(String imagelink, String Username, String Password,
    String Email, String Phone, String Adress) async {
  final Register = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final NewUser = UserClass(
      IsBussiness: false,
      image: imagelink,
      username: Username,
      email: Email,
      password: Password,
      PhoneNo: Phone,
       Address: Adress,
      Intrests: '00000');

  final json = NewUser.toJson();
  await Register.set(json);
}




