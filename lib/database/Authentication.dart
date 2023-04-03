import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String message = "";

String getError() {
  return message;
}

void setError(m) {
  message = m;
  //return message;
}

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    setError(e.toString());
    message = e.toString();
    //  print(e);
    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    message = e.toString();
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      message = "The password provided is too weak.";
    } else if (e.code == 'email-already-in-use') {
      setError(e.code);
      print('The account already exists for that email.');
      message = "The account already exists for that email.";
    }
    return false;
  } catch (e) {
    // print(e.toString());
    return false;
  }
}
