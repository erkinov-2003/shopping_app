

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _authInstance = FirebaseAuth.instance;

  Future<UserCredential> signIn(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw Exception("eror sign in $e");
    }
  }

  Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential? userCredential =
          await _authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw Exception("erors sign up $e");
    }
  }
}
