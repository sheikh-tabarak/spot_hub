import 'dart:io';

import 'package:path/path.dart' as Path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';

final _db = FirebaseFirestore.instance;

class Product {
  final String BussinessId;
  final String Category;
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
    required this.Category,
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
        'Category': Category,
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
      Category: data["Category"],
      Price: data["Price"],
      rating: data["rating"],
      reviews: data["reviews"],
      isRecommended: data["isRecommended"],
    );
  }
}

Future AddNewProduct(String ImageFileadress, String Ptitle, String PDescription,
    String PCategory, double PPrice) async {
  //Add Product

  final PostRequest = await FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .collection("products")
      .doc();

  // Upload Image
  String imageUploaded = "";
  await uploadProductImage(PostRequest.id, ImageFileadress)
      .then((value) => imageUploaded = value);

  final NewProduct = Product(
    BussinessId: "B_${FirebaseAuth.instance.currentUser!.uid}",
    Id: PostRequest.id,
    title: Ptitle,
    Category: PCategory,
    description: PDescription,
    image: imageUploaded,
    Price: PPrice,
    rating: 0.0,
    reviews: 0,
    isRecommended: false,
  );

  final json = NewProduct.toJson();
  await PostRequest.set(json);
}

///Edit Product

Future EditProduct(String PId, String thisisimage, String Ptitle,
    String PDescription, String PCategory, double PPrice) async {
  await FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .collection("products")
      .doc(PId)
      .update({
    'Category': PCategory,
    'Price': PPrice,
    'description': PDescription,
    'image': thisisimage,
    'title': Ptitle
  });
}

Stream<QuerySnapshot<Map<String, dynamic>>> ProductsofBussiness(
    String currentBussinessID) {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(currentBussinessID.substring(2))
      .collection("bussiness")
      .doc(currentBussinessID)
      .collection("products")
      .orderBy("Id", descending: false)
      .snapshots();
}

Future<String> uploadProductImage(
  String FileName,
  String FilePath,
) async {
  File file = File(FilePath);
  try {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage
        .ref('${FirebaseAuth.instance.currentUser!.email}/products/')
        .child(FileName);
    await ref.putFile(File(FilePath));
    String imageUrl = await ref.getDownloadURL();
    return imageUrl;
  } on firebase_core.FirebaseException catch (e) {
    print(e);
  }

  return '';
}

Future deleteProduct(String ProductId) async {
  await FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .collection("products")
      .doc(ProductId)
      .delete()
      .then((value) {});

  //var fileUrl = Uri.decodeFull(Path.basename(ProductId));
  final desertRef = firebase_storage.FirebaseStorage.instance
      .ref("${FirebaseAuth.instance.currentUser!.email}/products/$ProductId");
  await desertRef.delete();
}
