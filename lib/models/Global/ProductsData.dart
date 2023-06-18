import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

final _db = FirebaseFirestore.instance;

Future showAllProducts() async {
  _db.collectionGroup("products").get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} |${docSnapshot.get("title")}');
        //${docSnapshot.data()}
      }
    },

    //   print("Successfully completed" ),
    onError: (e) => print("Error completing: $e"),
  );
}

Stream<QuerySnapshot<Map<String, dynamic>>> ProductsOfAllBussinesses() {
  return FirebaseFirestore.instance
      .collectionGroup("products")
      // .orderBy("Id", descending: false)
      .snapshots();
}
