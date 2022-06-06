import 'package:flutter/material.dart';

import '../widgets/forgot_password_widget.dart';
import '../widgets/login_widget.dart';
import '../widgets/register_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key, required this.screenType}) : super(key: key);
  static const String authScreenTypeLogin = "LOGIN";
  static const String authScreenTypeRegister = "REGISTER";
  static const String authScreenTypeForgotPassword = "FORGOT_PASSWORD";
  final String screenType;

  @override
  State<StatefulWidget> createState() {
    return AuthenticationScreenState();
  }
}

class AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/white_backdrop.png"),
                    fit: BoxFit.cover)),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: getBody(),
            )));
  }

  Widget getBody(){
    switch(widget.screenType){
      case AuthenticationScreen.authScreenTypeRegister:
        return RegisterWidget();
      case AuthenticationScreen.authScreenTypeForgotPassword:
        return ForgotPasswordWidget();
      default :
        return LoginWidget();
    }
  }
}
