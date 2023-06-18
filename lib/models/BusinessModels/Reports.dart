import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _db = FirebaseFirestore.instance;

class Reports {
  final String UserId;
  final String ReportId;
  final String ReportTitle;
  final String ReportBody;
  final String ReportResponse;
  final String ReportStatus;

  Reports({
    required this.UserId,
    required this.ReportId,
    required this.ReportTitle,
    required this.ReportBody,
    required this.ReportResponse,
    required this.ReportStatus,
  });

  Map<String, dynamic> toJson() => {
        'UserId': UserId,
        'ReportId': ReportId,
        'ReportTitle': ReportTitle,
        'ReportBody': ReportBody,
        'ReportResponse': ReportResponse,
        'ReportStatus': ReportStatus,
      };

  factory Reports.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Reports(
      UserId: data["UserId"],
      ReportId: data["ReportId"],
      ReportTitle: data["ReportTitle"],
      ReportBody: data["ReportBody"],
      ReportResponse: data["ReportResponse"],
      ReportStatus: data["ReportStatus"],
    );
  }
}

Future PostReport(
  String ReportTitle,
  String ReportBody,
) async {
  DocumentSnapshot ds = await _db
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .get();
  String _Reports = ds.get('Reports').toString();

  final PostRequest = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .collection("reports")
      .doc("BusinessReport#$_Reports");

  await FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .update({
    'Reports': FieldValue.increment(1),
  });

  final NewReport = Reports(
    UserId: FirebaseAuth.instance.currentUser!.uid,
    ReportId: "BusinessReport#$_Reports",
    ReportTitle: ReportTitle,
    ReportBody: ReportBody,
    ReportResponse: "",
    ReportStatus: "Active",
  );

  final json = NewReport.toJson();
  await PostRequest.set(json);
}

Future RespondReport(String Response, bool isCompleted) async {
  await FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .update({
    'ReportResponse': Response,
    'ReportStatus': isCompleted == true ? "Solved" : "Refused"
  });
}

Future<Reports> GetSingleReport(String _ReportId) async {
  DocumentSnapshot ds = await _db
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .collection("reports")
      .doc(_ReportId)
      .get();

  Reports R = Reports(
    ReportBody: ds.get('ReportBody'),
    ReportId: ds.get('ReportId'),
    ReportResponse: ds.get('ReportResponse'),
    ReportStatus: ds.get('ReportStatus'),
    ReportTitle: ds.get('ReportTitle'),
    UserId: ds.get('UserId'),
  );
  return R;
}

Stream<QuerySnapshot<Map<String, dynamic>>> ReportsforBusiness() {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("bussiness")
      .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
      .collection("reports")
      .orderBy("ReportId", descending: true)
      .snapshots();
}
