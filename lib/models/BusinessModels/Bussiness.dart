import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _db = FirebaseFirestore.instance;

class Bussiness {
  final String BussinessId;
  final String BussinessImageUrl;
  final String BussinessName;
  final String BussinessEmail;
  final String BussinessCity;
  final String BussinessAddress;
  final String BussinessPhone;
  final String BussinessType;
  final String BussinessWebsite;
  final int Reports;

  const Bussiness({
    required this.BussinessId,
    required this.BussinessImageUrl,
    required this.BussinessName,
    required this.BussinessEmail,
    required this.BussinessCity,
    required this.BussinessAddress,
    required this.BussinessPhone,
    required this.BussinessType,
    required this.BussinessWebsite,
    required this.Reports,
  });

  Map<String, dynamic> toJson() => {
        'BussinessId': BussinessId,
        'BussinessImageUrl': BussinessImageUrl,
        'BussinessName': BussinessName,
        'BussinessEmail': BussinessEmail,
        'BussinessCity': BussinessCity,
        'BussinessAddress': BussinessAddress,
        "BussinessPhone": BussinessPhone,
        'BussinessType': BussinessType,
        'BussinessWebsite': BussinessWebsite,
        'Reports': Reports,
      };

  factory Bussiness.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Bussiness(
      BussinessId: data["BussinessId"],
      BussinessImageUrl: data["BussinessImageUrl"],
      BussinessName: data["BussinessName"],
      BussinessEmail: data["BussinessEmail"],
      BussinessCity: data["BussinessCity"],
      BussinessAddress: data["BussinessAddress"],
      BussinessPhone: data["BussinessPhone"],
      BussinessType: data["BussinessType"],
      BussinessWebsite: data["BussinessWebsite"],
      Reports: data["Reports"],
    );
  }
}

Future RegisterBussiness(
    String imagelink,
    String _BName,
    String _BEmail,
    String _BCity,
    String _BAddress,
    String _BPhone,
    String _BType,
    String BWeb) async {
  await FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    'IsBussiness': true,
  });

  final RegisterBussiness = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}");

  final NewBussines = Bussiness(
    BussinessId: "B_${FirebaseAuth.instance.currentUser!.uid}",
    BussinessImageUrl: imagelink,
    BussinessName: _BName,
    BussinessEmail: _BEmail,
    BussinessCity: _BCity,
    BussinessAddress: _BAddress,
    BussinessPhone: _BPhone,
    BussinessType: _BType,
    BussinessWebsite: BWeb,
    Reports: 0,
  );

  final json = NewBussines.toJson();
  await RegisterBussiness.set(json);
}

Future<Bussiness> getBussinessData() async {
  DocumentSnapshot ds = await _db
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .get();

  //String Email = ds.get('email');

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

    // IsBussiness: ds.get('IsBussiness'),
    // image: ds.get('image'),
    // username: ds.get('username'),
    // password: ds.get('password'),
    // email: ds.get('email'),
    // PhoneNo: ds.get('PhoneNo'),
    // Address: ds.get('Address'),
    // Intrests: ds.get('Intrests'),
    // UserId: ds.get("UserId")
  );
  // print(Email);

  return B;
}

// Future<int> TotalProducts() async {
//   int Total = 0;
//   FirebaseFirestore.instance
//       .collection('user')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection("bussiness")
//       .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
//       .collection("products")
//       .count()
//       .get()
//       .then((res) {
//     print("Product are total :  " + res.count.toString());
//     Total = res.count;
//     print("Product are total-- :  " + Total.toString());

//     return Total;
//   });

//   return Total;
// }
