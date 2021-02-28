import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'User.dart';
import '../Constants/Constants.dart' as ErrorTypes;

class Authentication {
  Future<AuthResult> singupUser(User user) async =>
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
  Future<AuthResult> loginUser(User user) async => await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password);

  Future<void> logoutUser() async => await FirebaseAuth.instance.signOut();

  showToast(BuildContext context, String message) =>
      Scaffold.of(context).showSnackBar(new SnackBar(content: Text(message)));

  handleError(e) {
    String errorType;

    if (Platform.isAndroid) {
      switch (e.message) {
        case ErrorTypes.ANDROID_ERROR_USER_NOT_FOUND:
          errorType = 'User not found';
          break;
        case ErrorTypes.ANDROID_ERROR_INVALIDE_USERNAME_PASSWORD:
          errorType = 'Invalid username password';
          break;
        case ErrorTypes.ANDROID_ERROR_USER_ALREADY_EXIST:
          errorType = 'User already exist';
          break;
        case ErrorTypes.ANDROID_ERROR_TIME_OUT:
          errorType = 'Time out';
          break;
        default:
          errorType = e.message;
          print('Case ${e.message} is not yet implemented');
      }
    } else if (Platform.isIOS) {
      switch (e.code) {
        case ErrorTypes.IOS_ERROR_17011:
          errorType = "User not found";
          break;
        case ErrorTypes.IOS_ERROR_17009:
          errorType = "Invalid username password";
          break;
        case ErrorTypes.IOS_ERROR_17020:
          errorType = "Network error";
          break;
        default:
          errorType = e.message;
          print('Case ${e.message} is not yet implemented');
      }
    }
    print('$errorType');
    return errorType;
  }
}
