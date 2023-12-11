import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future deleteuser(String id) async {
    User? user = await FirebaseAuth.instance.currentUser;
    user?.delete();
    FirebaseFirestore.instance.collection("users").doc(id).delete();
  }
}
