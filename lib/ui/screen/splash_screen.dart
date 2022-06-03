import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/white_backdrop_darki.png"), fit: BoxFit.cover)
        ),
        alignment: Alignment.center,
        child: Column(
          children: [

            const Spacer(),
            Image.asset('assets/images/logo.png', width: MediaQuery.of(context).size.width/3),
            const SizedBox(height: 12,),
            const Text("DRIVE SHARE  ", style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold,letterSpacing: 1)),
            const SizedBox(height: 4,),
            const Text("Relieve your Pocket from Travel Expenses", style: TextStyle(color: Colors.lightGreen, fontSize: 12, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}