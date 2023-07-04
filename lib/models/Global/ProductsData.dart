import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/BusinessModels/Reviews.dart';

final _db = FirebaseFirestore.instance;

// Future showAllProducts() async {
//   _db.collectionGroup("products").get().then(
//     (querySnapshot) {
//       print("Successfully completed");
//       for (var docSnapshot in querySnapshot.docs) {
//         print('${docSnapshot.id} |${docSnapshot.get("title")}');
//         //${docSnapshot.data()}
//       }
//     },

//     //   print("Successfully completed" ),
//     onError: (e) => print("Error completing: $e"),
//   );
// }

Stream<QuerySnapshot<Map<String, dynamic>>> ProductsOfAllBussinesses() {
  return FirebaseFirestore.instance
      .collectionGroup("products")
      // .orderBy("Id", descending: false)
      .snapshots();
}

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

  DocumentSnapshot updateReview = await _db
      .collection('user')
      .doc(_BId.substring(2))
      .collection("bussiness")
      .doc(_BId)
      .collection("products")
      .doc(Product_Id)
      .get();

  double OldRating = ds.get('rating');
  double NewRating = (OldRating + StarsR) / 2;

  final json = NewReview.toJson();
  await PublishRequest.set(json);

  await FirebaseFirestore.instance
      .collection('user')
      .doc(_BId.substring(2))
      .collection("bussiness")
      .doc(_BId)
      .collection("products")
      .doc(Product_Id)
      .update({
    'rating': NewRating,
    'reviews': FieldValue.increment(1),
    // 'Price': PPrice,
    // 'description': PDescription,
    // 'image': thisisimage,
    // 'title': Ptitle
  });
}






// Future<Bussiness> BussinessOfProduct(String BussinessId) async {

// _db.collection("user").doc(use)

//   Bussiness B = Bussiness(
//       BussinessId: "BussinessId",
//       BussinessImageUrl: "BussinessImageUrl",
//       BussinessName: "BussinessName",
//       BussinessEmail: "BussinessEmail",
//       BussinessCity: "BussinessCity",
//       BussinessAddress: "BussinessAddress",
//       BussinessPhone: "BussinessPhone",
//       BussinessType: "BussinessType",
//       BussinessWebsite: "BussinessWebsite",
//       Reports: 1);

//   return B;
// }
