import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _db = FirebaseFirestore.instance;

class Notifications {
  final String TimeStamp;
  final String ntype;
  final String fromuserId;
  final String ProductId;
  final bool isRead;

  Notifications({
    required this.TimeStamp,
    required this.ntype,
    required this.fromuserId,
    required this.ProductId,
    required this.isRead,
  });

  Map<String, dynamic> toJson() => {
        'TimeStamp': TimeStamp,
        'ntype': ntype,
        'fromuserId': fromuserId,
        'ProductId': ProductId,
        'isRead': isRead,
      };

  factory Notifications.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Notifications(
        TimeStamp: data['TimeStamp'],
        ntype: data['ntype'],
        fromuserId: data['fromuserId'],
        ProductId: data['ProductId'],
        isRead: data['isRead']);
  }
}

Future NewNotification(
  String type,
  String userid,
  String productid,
) async {
  final NotifyRequest = FirebaseFirestore.instance
      .collection('user')
      .doc(userid)
      .collection("notifications")
      .doc();

  final NewNotification = Notifications(
      TimeStamp: DateTime.now().toString(),
      ntype: type,
      fromuserId: FirebaseAuth.instance.currentUser!.uid,
      ProductId: productid,
      isRead: false);

  final json = NewNotification.toJson();
  await NotifyRequest.set(json);
}

Stream<QuerySnapshot<Map<String, dynamic>>> NotificationsofUser(String userId) {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(userId)
      .collection("notifications")
      .orderBy("TimeStamp", descending: false)
      .snapshots();
}

String getUsernamewithId(String Id) {
  String name = "";

  FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) => name = value["username"]);

  return name;
}

Future deleteReadedNotifications() async {
  // bool _isInitiated = false;

//  FirebaseFirestore _ds = FirebaseFirestore.instance;
  var deleteSendersMessages = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('notifications');

  var dsm = await deleteSendersMessages.get();
  for (var docs in dsm.docs) {
    await docs.reference.delete();
  }

  // _db
  //     .collection('user')
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .collection("chat")
  //     .doc(UserId)
  //     .delete()
  //     .then((value) {
  //   print("your record deleted");
  // });

  // var deleteRecieversMessages = FirebaseFirestore.instance
  //     .collection("user")
  //     .doc(UserId)
  //     .collection('chat')
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .collection('messages');
  // var drm = await deleteRecieversMessages.get();
  // for (var docs in drm.docs) {
  //   await docs.reference.delete();
  // }

  // _db
  //     .collection('user')
  //     .doc(UserId)
  //     .collection("chat")
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .delete()
  //     .then((value) {
  //   print("Reciever's record deleted");
  // });
}
