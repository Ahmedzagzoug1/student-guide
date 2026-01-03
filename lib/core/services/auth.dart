import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final FirebaseAuth auth=FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final  userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
       User? user=  userCredential.user;
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw _determineError(e);
    }
  }

  @override
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,

      );

      return userCredential.user;

    } on FirebaseAuthException catch (e) {
      throw _determineError(e);
    }
  }
  AuthError _determineError(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return AuthError.invalidEmail;
      case 'user-disabled':
        return AuthError.userDisabled;
      case 'user-not-found':
        return AuthError.userNotFound;
      case 'wrong-password':
        return AuthError.wrongPassword;
      case 'email-already-in-use':
      case 'account-exists-with-different-credential':
        return AuthError.emailAlreadyInUse;
      case 'invalid-credential':
        return AuthError.invalidCredential;
      case 'operation-not-allowed':
        return AuthError.operationNotAllowed;
      case 'weak-password':
        return AuthError.weakPassword;
      case 'ERROR_MISSING_GOOGLE_AUTH_TOKEN':
      default:
        return AuthError.error;
    }
  }
  //auth change listener

}





enum AuthError {
invalidEmail,
userDisabled,
userNotFound,
wrongPassword,
emailAlreadyInUse,
invalidCredential,
operationNotAllowed,
weakPassword,
error,
}
