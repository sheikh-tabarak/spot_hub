import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _db = FirebaseFirestore.instance;

class Reviews {
  final String ProductId;
  final String ReviewId;
  final String Name;
  final String Review;
  final double Stars;
  final String TimeStamp;

  Reviews(
      {required this.ReviewId,
      required this.ProductId,
      required this.Name,
      required this.Review,
      required this.Stars,
      required this.TimeStamp});

  Map<String, dynamic> toJson() => {
        'ProductId': ProductId,
        'ReviewId': ReviewId,
        'Name': Name,
        'Review': Review,
        'Stars': Stars,
        'TimeStamp': TimeStamp,
      };

  factory Reviews.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Reviews(
      ProductId: data["ProductId"],
      ReviewId: data["ReviewId"],
      Name: data["Name"],
      Review: data["Review"],
      Stars: data["Stars"],
      TimeStamp: data["TimeStamp"],
    );
  }
}

// Future PublishNewReview(
//   String BussinessId,
//   String Product_Id,
//   String Review,
//   double StarsR,
// ) async {
//   DocumentSnapshot ds = await _db
//       .collection("user")
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .get();
//   String UserName = ds.get('username');

//   final PublishRequest = FirebaseFirestore.instance
//       .collection('user')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection("bussiness")
//       .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
//       .collection("products")
//       .doc(Product_Id)
//       .collection("reviews")
//       .doc();

//   final NewReview = Reviews(
//     ReviewId: PublishRequest.id,
//     ProductId: Product_Id,
//     Name: UserName,
//     Review: Review,
//     TimeStamp: DateTime.now().toString(),
//     Stars: StarsR,
//   );

//   DocumentSnapshot updateReview = await _db
//       .collection('user')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection("bussiness")
//       .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
//       .collection("products")
//       .doc(Product_Id)
//       .get();
//   double OldRating = ds.get('rating');
//   double NewRating = (OldRating + StarsR) / 2;

//   final json = NewReview.toJson();
//   await PublishRequest.set(json);

//   await FirebaseFirestore.instance
//       .collection('user')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection("bussiness")
//       .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
//       .collection("products")
//       .doc(Product_Id)
//       .update({
//     'rating': NewRating,
//     'reviews': FieldValue.increment(1),
//     // 'Price': PPrice,
//     // 'description': PDescription,
//     // 'image': thisisimage,
//     // 'title': Ptitle
//   });
// }
