import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  const Bussiness(
      {required this.BussinessId,
      required this.BussinessImageUrl,
      required this.BussinessName,
      required this.BussinessEmail,
      required this.BussinessCity,
      required this.BussinessAddress,
      required this.BussinessPhone,
      required this.BussinessType,
      required this.BussinessWebsite});

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
    String BWeb
    ) async {
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
  );

  final json = NewBussines.toJson();
  await RegisterBussiness.set(json);
}
