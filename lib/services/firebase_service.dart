import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:share_drive_sl/utilities/fileReferenceHelper.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;

  late StreamSubscription listener;

  Future<String?> signIn(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    return user?.uid;
  }

  void passwordLessSignIn(String email) async {
    print(email);
    FirebaseAuth.instance
        .sendSignInLinkToEmail(email: email, actionCodeSettings: acs)
        .catchError(
            (onError) => print('Error sending email verification $onError'))
        .then((value) => print('Successfully sent email verification'));
  }

  Future<User?> signUp(String email, String password) async {
    print('Signing up');
    var completer = Completer<User?>();

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      completer.complete(credential.user);
    } on FirebaseAuthException catch (e) {
      completer.completeError(e.message ?? "Connection Error!");
    } catch (e) {
      completer.completeError('Something went wrong!');
    }

    return completer.future;
  }

  Future<User?> authStatus() async {
    var completer = Completer<User?>();

    if (_firebaseAuth.currentUser != null) {
      _firebaseAuth.currentUser
          ?.reload()
          .then((value) => {completer.complete(_firebaseAuth.currentUser)});
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

  Future<void> registerUser(
    String id,
    String firstName,
    String lastName,
    String phone,
    String email,
    String status,
    String address,
    String verificationType,
    String userImage,
    String verificationImageOne,
    String verificationImageTwo,
    bool didAgreeToPolicies,
  ) async {
    return _firebaseFireStore.collection("users").doc(email).set({
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'status': status,
      'address': address,
      'verificationType': verificationType,
      'userImage': userImage,
      'verificationImageOne': verificationImageOne,
      'verificationImageTwo': verificationImageTwo,
      'didAgreeToPolicies': didAgreeToPolicies,
    });
  }

  Reference getUploadReference(String type, String id, String extension){
    final storageRef = _firebaseStorage.ref();

    Reference? imagesRef = storageRef.child("images/${type}");

    final fileName = FileReferenceHelper.generateFileName(id, type) + extension;

    return imagesRef.child(fileName);
  }
}
