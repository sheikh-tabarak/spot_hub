// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/BusinessModels/Reviews.dart';

final _db = FirebaseFirestore.instance;

// Show Products of all bussinesses

Stream<QuerySnapshot<Map<String, dynamic>>> ProductsOfAllBussinesses() {
  return FirebaseFirestore.instance.collectionGroup("products").snapshots();
}

Stream<QuerySnapshot<Map<String, dynamic>>> AllBussinessesofSpothub() {
  return FirebaseFirestore.instance.collectionGroup("bussiness").snapshots();
}

Stream<QuerySnapshot<Map<String, dynamic>>> ProductsOfAllBussinessesSorted(
  int sortBy,
) {
  if (sortBy == 0) {
    // if (category != "") {
    return FirebaseFirestore.instance
        .collectionGroup("products")
        // .where("Category", isEqualTo: category)
        .snapshots();
    //  } else {
    // return FirebaseFirestore.instance.collectionGroup("products").snapshots();
    ///  }
  } else if (sortBy == 1) {
    return FirebaseFirestore.instance
        .collectionGroup("products")
        .orderBy("title", descending: false)
        .snapshots();
  } else if (sortBy == 2) {
    return FirebaseFirestore.instance
        .collectionGroup("products")
        // .where("title".toLowerCase(), arrayContains: title.toLowerCase())
        // .where("Id".toLowerCase(), arrayContains: title.toLowerCase())
        .orderBy("rating", descending: true)
        .snapshots();
  } else if (sortBy == 3) {
    return FirebaseFirestore.instance
        .collectionGroup("products")
        // .where("title".toLowerCase(), arrayContains: title.toLowerCase())
        .orderBy("Price", descending: true)
        .snapshots();
  } else if (sortBy == 4) {
    return FirebaseFirestore.instance
        .collectionGroup("products")
        // .where("title".toLowerCase(), arrayContains: title.toLowerCase())
        .orderBy("reviews", descending: true)
        .snapshots();
  } else {
    return FirebaseFirestore.instance.collectionGroup("products").snapshots();
  }
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
      //.orderBy("sendTime", descending: true)
      //  .orderBy("Id", descending: false)
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

  // print("User name = $UserName");

  final PublishRequest = FirebaseFirestore.instance
      .collection('user')
      .doc(_BId.substring(2))
      .collection("bussiness")
      .doc(_BId)
      .collection("products")
      .doc(Product_Id)
      .collection("reviews")
      .doc();

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
    for (var element in value.docs) {
      test = element["Stars"] + test;
    }

    average = test / value.docs.length;
  });

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
