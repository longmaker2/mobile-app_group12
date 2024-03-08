import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  Future<User?> SignUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }

  // sign in with email and password
  // ignore: non_constant_identifier_names
  Future<User?> SignInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }

  // sign out
  // ignore: non_constant_identifier_names
  Future<void> SignOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  // check if user is signed in
  // ignore: non_constant_identifier_names
  Future<bool> isSignedIn() async {
    final currentUser = _auth.currentUser;
    return currentUser != null;
  }

  // save the user in the database with the name and email
  // ignore: non_constant_identifier_names
  Future<void> saveUserInDatabase(String name, String email) async {
    try {
      await _fireStore.collection('users').doc(email).set({
        'name': name,
        'email': email,
      });
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
