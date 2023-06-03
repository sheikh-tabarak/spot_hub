// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _db = FirebaseFirestore.instance;

class Product {
  final String BussinessId;
  final String Id;
  final String image;
  final String title;
  final String description;
  final double Price;
  final double rating;
  final int reviews;
  final bool isRecommended;

  const Product({
    required this.BussinessId,
    required this.Id,
    required this.image,
    required this.description,
    required this.title,
    required this.Price,
    required this.rating,
    required this.reviews,
    required this.isRecommended,
  });

  Map<String, dynamic> toJson() => {
        'BussinessId': BussinessId,
        'Id': Id,
        'image': image,
        'description': description,
        'title': title,
        'Price': Price,
        'rating': rating,
        'reviews': reviews,
        'isRecommended': isRecommended,
      };

  factory Product.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Product(
      BussinessId: data["BussinessId"],
      Id: data["Id"],
      image: data["image"],
      description: data["description"],
      title: data["title"],
      Price: data["Price"],
      rating: data["rating"],
      reviews: data["reviews"],
      isRecommended: data["isRecommended"],
    );
  }
}

Future AddNewProduct(String Ptitle, String PDescription, String PCategory,
    double PPrice, String PLocation) async {
  DocumentSnapshot ds = await _db
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .get();
  String _NoOfProducts = ds.get('NoofProducts').toString();

  final PostRequest = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .collection("products")
      .doc("${_NoOfProducts}P_${FirebaseAuth.instance.currentUser!.uid}");

  await FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .update({
    'NoofProducts': FieldValue.increment(1),
  });

  final NewProduct = Product(
    BussinessId: "B_${FirebaseAuth.instance.currentUser!.uid}",
    Id: "${_NoOfProducts}P_${FirebaseAuth.instance.currentUser!.uid}",
    image:
        "https://www.freshone.com.pk/content/images/thumbs/default-image_550.png",
    title: Ptitle,
    description: PDescription,
    Price: PPrice,
    rating: 0.0,
    reviews: 0,
    isRecommended: false,
  );

  final json = NewProduct.toJson();
  await PostRequest.set(json);
}

Stream<QuerySnapshot<Map<String, dynamic>>> ProductsofBussiness() {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .collection("products")
      .orderBy("Id", descending: false)
      .snapshots();
}
