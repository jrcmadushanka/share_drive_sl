import 'package:flutter/material.dart';
import 'package:share_drive_sl/ui/widgets/default_button.dart';

import '../../utilities/custom_resources.dart';
import '../screens/authentication_screen.dart';
import 'default_text_field.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, this.isForgotPassword = false})
      : super(key: key);
  final bool isForgotPassword;

  @override
  State<StatefulWidget> createState() {
    return LoginWidgetState();
  }
}

class LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      width: double.infinity,
      alignment: Alignment.bottomLeft,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CustomResource.primaryGreen,
                  fontSize: 26),
            ),
            const SizedBox(
              height: 45,
            ),
            Row(children: [
              const Spacer(),
              Image.asset('assets/images/logo.png',
                  width: MediaQuery.of(context).size.width / 4,
                  alignment: Alignment.center),
              const Spacer()
            ]),
            Expanded(
                child: SingleChildScrollView(
                    child: widget.isForgotPassword
                        ? getForgotSection()
                        : getLoginSection()))
          ]),
    );
  }

  getLoginSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 46,
        ),
        const Text(
          "Email",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomResource.primaryGreen,
              fontSize: 14),
        ),
        Container(
          height: 45,
          margin: const EdgeInsets.only(top: 8, bottom: 12),
          child: const DefaultTextField("Enter email",
              type: TextInputType.emailAddress),
        ),
        const Text(
          "Password",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomResource.primaryGreen,
              fontSize: 14),
        ),
        const Text(
          "Keep this field empty to password less login",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomResource.primaryGreenGray,
              fontSize: 11),
        ),
        Container(
          height: 45,
          margin: const EdgeInsets.only(top: 8),
          child: const DefaultTextField(
            "Enter password",
            type: TextInputType.text,
            isSecure: true,
          ),
        ),
       // const SizedBox(height: 16),
        Row(children: [
          const Text(
            "Doesn't have an account?",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: CustomResource.primaryGreen,
                fontSize: 14),
          ),
          TextButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AuthenticationScreen(screenType: AuthenticationScreen.authScreenTypeRegister)));
          }, child: const Text(
            "Signup!",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14),
          ))
        ]),
        const SizedBox(height: 21,),
        DefaultButton("Let's Ride", (){

        })
      ],
    );
  }

  getForgotSection() {
    return const Text("Under Construction",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomResource.primaryGreen,
            fontSize: 24));
  }
}
