import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late StreamSubscription listener;

  Future<String?> signIn(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    return user?.uid;
  }

  void passwordLessSignIn(String email) async {

    print(email);
    FirebaseAuth.instance.sendSignInLinkToEmail(
        email: email, actionCodeSettings: acs)
        .catchError((onError) => print('Error sending email verification $onError'))
        .then((value) => print('Successfully sent email verification'));
  }

  Future<User?> signUp(String email, String password) async {
    print('Signing up');
    var completer = Completer<User?>();

    try {
      print('Signing up 1');
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Signing up 2');
      completer.complete(credential.user);
      print('Signing up 3');
    } on FirebaseAuthException catch (e) {
      completer.completeError(e.message ?? "Connection Error!");
    } catch (e) {
      print('Signing up catch');
      print(e);
      completer.completeError('Something went wrong!');
    }

    return completer.future;
  }

  Future<User?> authStatus() async {
    var completer = Completer<User?>();

    if(_firebaseAuth.currentUser != null){
      _firebaseAuth.currentUser?.reload().then((value) => {
        completer.complete(_firebaseAuth.currentUser)
      });
    } else {
      completer.completeError("No singed in users");
    }
    return completer.future;
  }

  var acs = ActionCodeSettings(
    // URL you want to redirect back to. The domain (www.example.com) for this
    // URL must be whitelisted in the Firebase Console.
      url: 'https://civdevops.page.link/pl_login',
      // This must be true
      handleCodeInApp: true,
      androidPackageName: 'com.civdevops.share_drive_sl',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '10');

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
