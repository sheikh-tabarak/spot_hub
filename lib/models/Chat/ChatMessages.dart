import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spot_hub/database/Authentication.dart';

final _db = FirebaseFirestore.instance;

class ChatMessages {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  bool isSent;
  int type;

  ChatMessages(
      {required this.idFrom,
      required this.idTo,
      required this.timestamp,
      required this.content,
      required this.isSent,
      required this.type});

  Map<String, dynamic> toJson() => {
        'idFrom': idFrom,
        'idTo': idTo,
        'timestamp': timestamp,
        'content': content,
        'isSent': isSent,
        'type': type,
      };

  factory ChatMessages.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ChatMessages(
      idFrom: data["idFrom"],
      idTo: data["idTo"],
      timestamp: data["timestamp"],
      content: data["content"],
      isSent: data["isSent"],
      type: data["type"],
    );
  }
}




Future sendMessage(
  String UserId,
  String Message,
) async {

  // await FirebaseFirestore.instance
  //     .collection('user')
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .collection("chats")
  //     .doc(UserId)
  //     .update({
  //   'LatestMessage': Message,
  // });

  // await FirebaseFirestore.instance
  //     .collection('user')
  //     .doc(UserId)
  //     .collection("chats")
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .update({
  //   'LatestMessage': Message,
  // });

  final SendMessage = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("chat")
      .doc(UserId)
      .collection("messages")
      .doc();

  final Send_Message = ChatMessages(
    idFrom: FirebaseAuth.instance.currentUser!.uid,
    idTo: UserId,
    timestamp: DateTime.now().toString(),
    content: Message,
    isSent: true,
    type: 0,
  );


 await FirebaseFirestore.instance
      .collection('user')
      .doc(UserId)
      .collection("chat")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    'LatestMessage': Message,
    'unReadMessages':FieldValue.increment(1),
  });


  await FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("chat")
      .doc(UserId)
      .update({
    'LatestMessage': Message,
  });


  //  DocumentSnapshot ds = await _db
  //     .collection("user")
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .get();

  // //_isInitiated = ds.get('isIntiated');

  // if (_isInitiated == false) {

  //     await FirebaseFirestore.instance
  //     .collection('user')
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .collection("chats")
  //     .doc(UserId)
  //     .update({
  //   'LatestMessage': Message,
    
  // });



  final sending = Send_Message.toJson();
  await SendMessage.set(sending);

  final ReceiveMessage = FirebaseFirestore.instance
      .collection('user')
      .doc(UserId)
      .collection("chat")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("messages")
      .doc();

  final Recieve_Message = ChatMessages(
    idFrom: FirebaseAuth.instance.currentUser!.uid,
    idTo: UserId,
    timestamp: DateTime.now().toString(),
    content: Message,
    isSent: false,
    type: 0,
  );

  final recieving = Recieve_Message.toJson();
  await ReceiveMessage.set(recieving);
}

Stream<QuerySnapshot<Map<String, dynamic>>> GetAllChatwithUser(
    String ChatUserId) {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("chat")
      .doc(ChatUserId)
      .collection("messages")
      .orderBy("timestamp", descending: false)
      .snapshots();
}

Stream<QuerySnapshot<Map<String, dynamic>>> ChatInitiatedUsers() {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("chat")
      .snapshots();
}




Future readAllMessages(
  String UserId,
) async {

await FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("chat")
      .doc(UserId)
      .update({
    'unReadMessages':0,
  });
}