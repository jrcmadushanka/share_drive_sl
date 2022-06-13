import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_drive_sl/ui/widgets/default_button.dart';
import 'package:share_drive_sl/ui/widgets/selectablel_icon_button.dart';
import 'package:share_drive_sl/utilities/application_constants.dart';
import '../../utilities/custom_resources.dart';
import 'default_text_field.dart';
import 'number_box.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterWidgetState();
  }
}

class RegisterWidgetState extends State<RegisterWidget> {
  int section = 2;
  String verificationType = ApplicationConstants.verificationTypeNIC;
  File? document1;
  File? document2;
  File? document3;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 60),
        padding: const EdgeInsets.all(16),
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
                      const Spacer(),
                      NumberBox(isSelected: section == 1, number: "1"),
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: 2,
                        color: Colors.grey,
                      )),
                      NumberBox(isSelected: section == 2, number: "2"),
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: 2,
                        color: Colors.grey,
                      )),
                      NumberBox(isSelected: section == 3, number: "3"),
                      const Spacer(),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: section == 1
                    ? getSectionOne()
                    : section == 2
                        ? getSectionTwo()
                        : getSectionTwo(),
              ))
            ]));
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
                color: CustomResource.primaryGreen,
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
                color: CustomResource.primaryGreen,
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
                color: CustomResource.primaryGreen,
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
                color: CustomResource.primaryGreen,
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
                color: CustomResource.primaryGreen,
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
        children: [
          const Text(
            "Please upload clear images of your verification documents.",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreenLight,
                fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "This documents will be used to confirm the identity of the users in order to secure the Share Drive community. This documents won't be shared with any other third party users unless there is a legal reason",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: CustomResource.primaryGreenLight,
                fontSize: 11),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 26,
          ),
          const Text(
            "Select contact verification type",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreen,
                fontSize: 14),
          ),
          Row(
            children: [
              IconSelectableButton(
                isSelected: verificationType ==
                    ApplicationConstants.verificationTypeNIC,
                icon: "assets/icons/id.png",
                text: 'NIC',
                onClick: () {
                  setVerificationType(ApplicationConstants.verificationTypeNIC);
                },
              ),
              const Spacer(),
              IconSelectableButton(
                isSelected: verificationType ==
                    ApplicationConstants.verificationTypeDrivingLicense,
                icon: "assets/icons/licence.png",
                text: 'Driving Licence',
                onClick: () {
                  setVerificationType(
                      ApplicationConstants.verificationTypeDrivingLicense);
                },
              ),
              const Spacer(),
              IconSelectableButton(
                isSelected: verificationType ==
                    ApplicationConstants.verificationTypePassport,
                icon: "assets/icons/passport.png",
                text: 'Passport',
                onClick: () {
                  setVerificationType(
                      ApplicationConstants.verificationTypePassport);
                },
              ),
            ],
          ),
          Text(
            "Take a clear photo of the ${verificationType == ApplicationConstants.verificationTypePassport ? "first page of your $verificationType" : "front side of your $verificationType"}",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreen,
                fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(children: [
            InkWell(
                onTap: () {
                  chooseImage(1, true);
                },
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: CustomResource.primaryGreen,
                    radius: const Radius.circular(10),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          height: 100,
                          width: 160,
                          decoration: BoxDecoration(
                            color:
                                CustomResource.primaryGreenLight.withAlpha(70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: document1 == null
                              ? const Icon(
                                  Icons.photo_camera,
                                  color: Colors.white,
                                )
                              : Image.file(document1!, fit: BoxFit.cover),
                        )))),
            const Spacer()
          ]),
          if (verificationType != ApplicationConstants.verificationTypePassport)
            const SizedBox(
              height: 21,
            ),
          if (verificationType != ApplicationConstants.verificationTypePassport)
            Text(
              "Take a clear photo of the back side of your $verificationType",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CustomResource.primaryGreen,
                  fontSize: 14),
            ),
          if (verificationType != ApplicationConstants.verificationTypePassport)
            const SizedBox(
              height: 8,
            ),
          if (verificationType != ApplicationConstants.verificationTypePassport)
            Row(children: [
              InkWell(
                  onTap: () {
                    chooseImage(2, true);
                  },
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: CustomResource.primaryGreen,
                      radius: const Radius.circular(10),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 100,
                            width: 160,
                            decoration: BoxDecoration(
                              color: CustomResource.primaryGreenLight
                                  .withAlpha(70),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: document2 == null
                                ? const Icon(
                                    Icons.photo_camera,
                                    color: Colors.white,
                                  )
                                : Image.file(document2!, fit: BoxFit.cover),
                          )))),
              const Spacer()
            ]),
          const SizedBox(
            height: 21,
          ),
          const Text(
            "Take a clear photo of your self",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreen,
                fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(children: [
            InkWell(
                onTap: () {
                  chooseImage(3, false);
                },
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: CustomResource.primaryGreen,
                    radius: const Radius.circular(10),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            height: 100,
                            width: 160,
                            decoration: BoxDecoration(
                              color: CustomResource.primaryGreenLight
                                  .withAlpha(70),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: document3 == null
                                ? const Icon(
                                    Icons.photo_camera,
                                    color: Colors.white,
                                  )
                                : Image.file(document3!, fit: BoxFit.cover))))),
            const Spacer()
          ]),
          const SizedBox(
            height: 21,
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
          TextButton(
              onPressed: () => setState(() {
                    section = 1;
                  }),
              child: const Text("Back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomResource.primaryGreen)))
        ]);
  }

  Widget getSectionThree() {
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

  setVerificationType(String type) {
    setState(() {
      verificationType = type;
      document1 = null;
      document2 = null;
      document3 = null;
    });
  }

  Future<void> chooseImage(int index, bool isRear) async {
    Future<XFile?> file = ImagePicker().pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: isRear ? CameraDevice.rear : CameraDevice.front);

    file.then((value) => {
          if (value != null)
            {
              setState(() {
                if (index == 1) {
                  document1 = File(value.path);
                  return;
                } else if (index == 2) {
                  document2 = File(value.path);
                } else {
                  document3 = File(value.path);
                }
              })
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "Something went wrong! Capture the image again.",
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.amber,
              ))
            }
        });
  }
}
