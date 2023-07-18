import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

String message = "";

String getError() {
  return message;
}

void setError(m) {
  message = m;
  //return message;
}

String clearError(String error) {
  String cleanedError = "";
  cleanedError =
      error.replaceRange(error.indexOf("["), error.indexOf("]") + 2, "");
  return cleanedError;
}

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    setError(e.toString());
    // ignore: unused_local_variable
    String message = clearError(e.toString());

// setError(e.toString());
// String message = e.toString().replaceRange(e.toString().indexOf("["), e.toString().indexOf("]")+2, "");
// print(message);

    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    setError(e.toString());
    // message = e.toString();
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      String message = clearError(e.toString());
      // setError(e.toString());
      // String message = e.toString().replaceRange(
      //     e.toString().indexOf("["), e.toString().indexOf("]") + 2, "");
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      // setError(e.code);
      String message = clearError(e.toString());
      // setError(e.toString());
      // String message = e.toString().replaceRange(
      //     e.toString().indexOf("["), e.toString().indexOf("]") + 2, "");
//      message = "The account already exists for that email.";
    }
    return false;
  } catch (e) {
    setError(e.toString());
    String message = clearError(e.toString());
    // String message = e.toString().replaceRange(e.toString().indexOf("["), e.toString().indexOf("]")+1, "");
    // setError(e.toString());
    // String message = e.toString().replaceRange(
    //     e.toString().indexOf("["), e.toString().indexOf("]") + 2, "");
    return false;
  }
}

logOut() {
  FirebaseAuth.instance.signOut();
}

// Method for Uploading Profile !!!

Future<String> uploadProfilePicture(
  String FileName,
  String FilePath,
) async {
  File file = File(FilePath);
  try {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage
        .ref('${FirebaseAuth.instance.currentUser!.email}/profile/')
        .child(FileName);
    await ref.putFile(File(FilePath));
    String imageUrl = await ref.getDownloadURL();
    print("Image URL : " + imageUrl);
    return imageUrl;
  } on firebase_core.FirebaseException catch (e) {
    print(e);
  }

  return '';
}

// Method for Account Information update !!!
Future<bool> updateAccountInfo(String name, String Address, String Imagelink,
    String Phone, String Intrests) async {
  try {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'Address': Address,
      'Intrests': Intrests,
      'PhoneNo': Phone,
      'image': Imagelink,
      'username': name
    });
    setError("Updated Sucessfully");
    return true;
  } catch (e) {
    setError(e.toString());
    print("This is error: " + message);
    //  String message = clearError(e.toString());
    return false;
  }
}

Future resetmypassword(String email) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
