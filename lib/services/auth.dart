import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:xiomi_ode_to_code/utils/toast.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  // current firebase user
  Future<User?> currentFirebaseUser() async {
    User? firebaseUser = auth.currentUser;
    if (firebaseUser != null) {
      return firebaseUser;
    } else {
      return null;
    }
  }

  // check if logged in
  Future<bool> isLoggedIn() async {
    User? user = await currentFirebaseUser();
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  // create user with email
  Future<User?> createUserWithMail(String email, String pwd) async {
    String errorMessage = 'Something Went Wrong!';
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      return result.user;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "email-already-in-use":
          errorMessage = "Email is already in use on different account";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      debugPrint(error.code);
      showToast(errorMessage);
      return null;
    } catch (e) {
      debugPrint(e.toString());
      showToast(errorMessage);
      return null;
    }
  }

  // sign in user with email
  Future<bool> signInEmail(String uEmail, String password) async {
    String errorMessage = 'Something Went Wrong!';
    try {
      await auth.signInWithEmailAndPassword(email: uEmail, password: password);
      return true;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Invalid Email Provided";
          break;
        case "user-not-found":
          errorMessage = "There is no user corresponding to the given email";
          break;
        case "wrong-password":
          errorMessage = "Password is invalid for the given email";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      debugPrint(error.code);
      showToast(errorMessage);
      return false;
    } catch (e) {
      debugPrint(e.toString());
      showToast(errorMessage);
      return false;
    }
  }

  // reset password
  Future<bool> resetPwd(String email) async {
    String errorMessage = 'Something Went Wrong!';
    try {
      await auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "user-not-found":
          errorMessage = "There is no user corresponding to the given email";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      debugPrint(error.code);
      showToast(errorMessage);
      return false;
    } catch (e) {
      debugPrint(e.toString());
      showToast(errorMessage);
      return false;
    }
  }
}
