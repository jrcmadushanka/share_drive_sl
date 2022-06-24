import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../services/firebase_service.dart';
import 'authentication_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/white_backdrop.png"),
                fit: BoxFit.cover)),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(),
            Image.asset('assets/images/logo.png',
                width: MediaQuery.of(context).size.width / 3),
            const SizedBox(
              height: 12,
            ),
            const Text("DRIVE SHARE  ",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
            const SizedBox(
              height: 4,
            ),
            const Text("Relieve your Pocket from Travel Expenses",
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseService firebaseService = GetIt.I.get<FirebaseService>();

    _timer = Timer(const Duration(seconds: 2), () {
      firebaseService
          .authStatus()
          .then((value) {Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const AuthenticationScreen(
              screenType: AuthenticationScreen.authScreenTypeLogin))); print("--------------------------------------------------------------------");})
          .onError((error, stackTrace) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => const AuthenticationScreen(
                        screenType: AuthenticationScreen.authScreenTypeLogin)));
              });
    });
  }
}
