import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:share_drive_sl/ui/widgets/default_button.dart';
import '../../utilities/custom_resources.dart';
import 'default_text_field.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterWidgetState();
  }
}

class RegisterWidgetState extends State<RegisterWidget> {
  int section = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              const Text(
                "Register",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomResource.primaryGreen,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Spacer(),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                            color: CustomResource.primaryGreen,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        alignment: Alignment.center,
                        child: const Text(
                          "1",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: 2,
                        color: Colors.grey,
                      )),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                            color: CustomResource.primaryGreenDark,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        alignment: Alignment.center,
                        child: const Text(
                          "2",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: 2,
                        color: Colors.grey,
                      )),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                            color: CustomResource.primaryGreenGray,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        alignment: Alignment.center,
                        child: const Text(
                          "3",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Spacer(),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              section == 1
                  ? getSectionOne()
                  : section == 2
                      ? getSectionTwo()
                      : getSectionTwo()
            ])));
  }

  Widget getSectionOne() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "First name",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreenLight,
                fontSize: 14),
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const DefaultTextField(
                "Enter first name", null, false, TextInputType.text),
          ),
          const Text(
            "Last name",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreenLight,
                fontSize: 14),
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const DefaultTextField(
                "Enter last name", null, false, TextInputType.text),
          ),
          const Text(
            "Email",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreenLight,
                fontSize: 14),
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const DefaultTextField(
                "Enter email", null, false, TextInputType.text),
          ),
          const Text(
            "Phone number",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreenLight,
                fontSize: 14),
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const DefaultTextField(
                "Enter phone", null, false, TextInputType.text),
          ),
          const Text(
            "Address",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreenLight,
                fontSize: 14),
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const DefaultTextField(
                "Enter address", null, false, TextInputType.text),
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: DefaultButton("Continue Registration", () {
              setState(() {
                section = 2;
              });
            }),
          ),
        ]);
  }

  Widget getSectionTwo() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            "First name",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreenLight,
                fontSize: 14),
          )
        ]);
  }
}
