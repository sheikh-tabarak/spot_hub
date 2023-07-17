import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';

final _db = FirebaseFirestore.instance;

class Chat {
  String ChatUserId;
  String ChatUsername;
  String ChatUserimage;
  int unReadMessages;
  int FreindshipStatus;
  String LatestMessage;
  String initiateTime;

  Chat({
    required this.ChatUserId,
    required this.ChatUsername,
    required this.ChatUserimage,
    required this.unReadMessages,
    required this.LatestMessage,
    required this.initiateTime,
    required this.FreindshipStatus,
  });

  Map<String, dynamic> toJson() => {
        'ChatUserId': ChatUserId,
        'ChatUsername': ChatUsername,
        'ChatUserimage': ChatUserimage,
        'unReadMessages': unReadMessages,
        'LatestMessage': LatestMessage,
        'initiateTime': initiateTime,
        'FreindshipStatus': FreindshipStatus,
      };

  factory Chat.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Chat(
      ChatUserId: data["ChatUserId"],
      ChatUsername: data["ChatUsername"],
      ChatUserimage: data["ChatUserimage"],
      unReadMessages: data["unReadMessages"],
      LatestMessage: data["LatestMessage"],
      initiateTime: data["initiateTime"],
      FreindshipStatus: data["FreindshipStatus"],
    );
  }
}

Future initiateChat(
  String UserId,
  // String username,
  // String Image
  // String Message
) async {
  String _SenderUsername = "Spothub User";
  String _SenderImage = "";

  String _Recieverusername = "Spothub User";
  String _RecieverImage = "";

  await getSpecificUserData(UserId).then((value) {
    _Recieverusername = value.username;
    _RecieverImage = value.image;
  });

  await getSpecificUserData(FirebaseAuth.instance.currentUser!.uid)
      .then((value) {
    _SenderUsername = value.username;
    _SenderImage = value.image;
  });

  bool _isInitiated = false;

  final intitalizeSendersChat = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("chat")
      .doc(UserId);

  final initiateSender = Chat(
    ChatUserId: UserId,
    ChatUsername: _Recieverusername,
    ChatUserimage: _RecieverImage,
    unReadMessages: 0,
    LatestMessage: "You are now friends",
    FreindshipStatus: 1,
    initiateTime: DateTime.now().toString(),
  );

  final sending = initiateSender.toJson();
  await intitalizeSendersChat.set(sending);

  final intitalizeRecieverChat = FirebaseFirestore.instance
      .collection('user')
      .doc(UserId)
      .collection("chat")
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final initiateReciever = Chat(
    ChatUserId: FirebaseAuth.instance.currentUser!.uid,
    ChatUserimage: _SenderImage,
    ChatUsername: _SenderUsername,
    unReadMessages: 0,
    LatestMessage: "You are now friends",
    FreindshipStatus: 1,
    initiateTime: DateTime.now().toString(),
  );

  final recieving = initiateReciever.toJson();
  await intitalizeRecieverChat.set(recieving);

  // DocumentSnapshot ds = await _db
  //     .collection("user")
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .get();

  // _isInitiated = ds.get('isIntiated');

  // if (_isInitiated == false) {

  //     await FirebaseFirestore.instance
  //     .collection('user')
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .collection("chats")
  //     .doc(UserId)
  //     .update({
  //   'LatestMessage': "Message",
  // });
}

Future Deletechat(
  String UserId,
) async {
  // bool _isInitiated = false;

//  FirebaseFirestore _ds = FirebaseFirestore.instance;
  var deleteSendersMessages = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('chat')
      .doc(UserId)
      .collection('messages');

  var dsm = await deleteSendersMessages.get();
  for (var docs in dsm.docs) {
    await docs.reference.delete();
  }

  _db
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("chat")
      .doc(UserId)
      .delete()
      .then((value) {
    print("your record deleted");
  });

  var deleteRecieversMessages = FirebaseFirestore.instance
      .collection("user")
      .doc(UserId)
      .collection('chat')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('messages');
  var drm = await deleteRecieversMessages.get();
  for (var docs in drm.docs) {
    await docs.reference.delete();
  }

  _db
      .collection('user')
      .doc(UserId)
      .collection("chat")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .delete()
      .then((value) {
    print("Reciever's record deleted");
  });
}
