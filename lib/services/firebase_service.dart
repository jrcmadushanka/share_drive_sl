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

    //?.reload();
    // listener = _firebaseAuth.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //     completer.completeError("No singed in users");
    //   } else {
    //     completer.complete(user);
    //   }
    //   listener.cancel();
    // });
    return completer.future;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
