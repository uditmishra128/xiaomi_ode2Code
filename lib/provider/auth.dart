import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/services/auth.dart';
import 'package:xiomi_ode_to_code/utils/locator.dart';

// ignore_for_file: constant_identifier_names
enum Status {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated,
  GivedPOS,
}

class AuthProvider extends ChangeNotifier {
  Status _status = Status.Uninitialized;
  Status get status => _status;
  AuthProvider() {
    locator
        .get<AuthService>()
        .auth
        .authStateChanges()
        .listen(onAuthStateChanged);
  }
  //detect live auth changes
  Future<void> onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
      notifyListeners();
    } else {
      User? firebaseUser =
          await locator.get<AuthService>().currentFirebaseUser();
      if (firebaseUser == null) {
        _status = Status.Unauthenticated;
        notifyListeners();
      } else {
        _status = Status.Authenticated;
        notifyListeners();
      }
    }
  }

  //sign up user with email pass
  Future<String?> registerWithEmailAndPassword(
      String email, String password) async {
    notifyListeners();
    User? user =
        await locator.get<AuthService>().createUserWithMail(email, password);
    if (user != null) {
      _status = Status.Authenticated;
      notifyListeners();
      return user.uid;
    } else {
      _status = Status.Unauthenticated;
      notifyListeners();
      return null;
    }
  }

  //sign in with email and password
  Future<bool> signInWithEmailAndPassword(
      {required String uEmail, required String password}) async {
    _status = Status.Authenticating;
    notifyListeners();
    bool success =
        await locator.get<AuthService>().signInEmail(uEmail, password);
    if (success) {
      _status = Status.Authenticated;
      notifyListeners();
      return true;
    } else {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }
}
