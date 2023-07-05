import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:get/get.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/BusinessModels/Reviews.dart';

final _db = FirebaseFirestore.instance;

// Show Products of all bussinesses

Stream<QuerySnapshot<Map<String, dynamic>>> ProductsOfAllBussinesses() {
  return FirebaseFirestore.instance
      .collectionGroup("products")
      // .orderBy("Id", descending: false)
      .snapshots();
}

// Show Prdoucts of specific bussiness

Stream<QuerySnapshot<Map<String, dynamic>>> ProductsofThatBussiness(
    String BId) {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(BId.substring(2))
      .collection("bussiness")
      .doc(BId)
      .collection("products")
      .orderBy("Id", descending: false)
      .snapshots();
}

// Show Bussiness Details on product page !!

Future<Bussiness> BussinessOfProduct(String BId) async {
  DocumentSnapshot ds = await _db
      .collection("user")
      .doc(BId.substring(2))
      .collection("bussiness")
      .doc(BId)
      .get();

  Bussiness B = Bussiness(
    BussinessName: ds.get("BussinessName"),
    BussinessImageUrl: ds.get("BussinessImageUrl"),
    BussinessEmail: ds.get("BussinessEmail"),
    BussinessAddress: ds.get("BussinessAddress"),
    BussinessId: ds.get("BussinessId"),
    BussinessCity: ds.get("BussinessCity"),
    BussinessPhone: ds.get("BussinessPhone"),
    BussinessType: ds.get("BussinessType"),
    BussinessWebsite: ds.get("BussinessWebsite"),
    Reports: ds.get("Reports"),
  );

  return B;
}

// To write New Review !!!

Future PublishNewReview(
  String _BId,
  String Product_Id,
  String Review,
  double StarsR,
) async {
  DocumentSnapshot ds = await _db
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();
  String UserName = ds.get('username');

  print("User name = $UserName");

  final PublishRequest = FirebaseFirestore.instance
      .collection('user')
      .doc(_BId.substring(2))
      .collection("bussiness")
      .doc(_BId)
      .collection("products")
      .doc(Product_Id)
      .collection("reviews")
      .doc();

  print("id Assigned = ${PublishRequest.id}");

  final NewReview = Reviews(
    ReviewId: PublishRequest.id,
    ProductId: Product_Id,
    Name: UserName,
    Review: Review,
    TimeStamp: DateTime.now().toString(),
    Stars: StarsR,
  );

  final json = NewReview.toJson();
  await PublishRequest.set(json);

  double test = 0;
  double average = 0;

  await FirebaseFirestore.instance
      .collection('user')
      .doc(_BId.substring(2))
      .collection("bussiness")
      .doc(_BId)
      .collection("products")
      .doc(Product_Id)
      .collection('reviews')
      .get()
      .then((value) {
    print(value.docs.length);

    value.docs.forEach((element) {
      test = element["Stars"] + test;
      print(element["Stars"]);
    });

    average = test / value.docs.length;

    print(average);
  });

  print("rest");

  await FirebaseFirestore.instance
      .collection('user')
      .doc(_BId.substring(2))
      .collection("bussiness")
      .doc(_BId)
      .collection("products")
      .doc(Product_Id)
      .update({
    'rating': average.toPrecision(2),
    'reviews': FieldValue.increment(1),
  });
}

// Show Review of all products which a customer is opening !!

Stream<QuerySnapshot<Map<String, dynamic>>> ReviewsofThatProduct(
    String _Product_Id, String _BId) {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(_BId.substring(2))
      .collection("bussiness")
      .doc(_BId)
      .collection("products")
      .doc(_Product_Id)
      .collection('reviews')
      .snapshots();
}
