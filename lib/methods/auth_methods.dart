import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? getcurrentuser()
  {
    return _auth.currentUser;
  }
  Future<UserCredential> signin(String email, String password) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _firestore
          .collection('users')
          .doc(cred.user!.uid)
          .set({'uid': cred.user!.uid, 'email': cred.user!.email});
      return cred;
    } on FirebaseAuthException catch (e) {
      throw (Exception(e.code),);
    }
  }

  Future<UserCredential> register(
      String email, String username, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set({'uid': credential.user!.uid, 'email': credential.user!.email});
      return credential;
    } on FirebaseAuthException catch (e) {
      throw (Exception(e.code),);
    }
  }

  Future<void> signout() async {
    await _auth.signOut();
  }
}
