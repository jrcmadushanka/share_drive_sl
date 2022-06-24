import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_drive_sl/ui/widgets/default_button.dart';
import 'package:share_drive_sl/ui/widgets/selectablel_icon_button.dart';
import 'package:share_drive_sl/utilities/application_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/firebase_service.dart';
import '../../utilities/custom_resources.dart';
import '../screens/authentication_screen.dart';
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
  late FirebaseService firebaseService;

  int section = 1;
  String verificationType = ApplicationConstants.verificationTypeNIC;
  File? document1;
  File? document2;
  File? document3;
  bool userAgreed = false;

  final _formKey = GlobalKey<FormState>();
  var phoneFieldController = TextEditingController();
  var firstNameFieldController = TextEditingController();
  var lastNameFieldController = TextEditingController();
  var emailFieldController = TextEditingController();
  var addressFieldController = TextEditingController();
  var passwordFieldController = TextEditingController();
  var rePasswordFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firebaseService = GetIt.I.get<FirebaseService>();
  }

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
                        : getSectionThree(),
              ))
            ]));
  }

  Widget getSectionOne() {
    return Form(
        key: _formKey,
        child: Column(
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
                margin: const EdgeInsets.only(top: 8, bottom: 21),
                child: DefaultTextField("Enter first name",
                    type: TextInputType.name,
                    controller: firstNameFieldController),
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
                margin: const EdgeInsets.only(top: 8, bottom: 21),
                child: DefaultTextField("Enter last name",
                    type: TextInputType.name,
                    controller: lastNameFieldController),
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
                margin: const EdgeInsets.only(top: 8, bottom: 21),
                child: DefaultTextField("Enter email",
                    type: TextInputType.emailAddress,
                    controller: emailFieldController),
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
                  margin: const EdgeInsets.only(top: 8, bottom: 21),
                  child: Row(
                    children: [
                      const Text(
                        "+94",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomResource.primaryGreen,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: DefaultTextField(
                        "Enter phone",
                        type: TextInputType.phone,
                        controller: phoneFieldController,
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          LengthLimitingTextInputFormatter(10,
                              maxLengthEnforcement: MaxLengthEnforcement
                                  .truncateAfterCompositionEnds)
                        ],
                      )),
                    ],
                  )),
              const Text(
                "Address",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomResource.primaryGreen,
                    fontSize: 14),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.only(top: 8, bottom: 21),
                child: DefaultTextField("Enter address",
                    type: TextInputType.streetAddress,
                    controller: emailFieldController),
              ),
              const Text(
                "Password",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomResource.primaryGreen,
                    fontSize: 14),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.only(top: 8, bottom: 21),
                child: DefaultTextField("Enter Password",
                    isSecure: true, controller: passwordFieldController),
              ),
              const Text(
                "Re-Password",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomResource.primaryGreen,
                    fontSize: 14),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.only(top: 8, bottom: 21),
                child: DefaultTextField("Reenter the Password",
                    isSecure: true, controller: rePasswordFieldController),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: DefaultButton("Continue Registration", () {
                  setState(() {
                    section = 2;
                  });
                }),
              ),
            ]));
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
          Container(
            margin: const EdgeInsets.only(top: 16),
            height: 1,
            color: CustomResource.primaryGreenGray.withAlpha(50),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Select user verification type",
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
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            height: 1,
            color: CustomResource.primaryGreenGray.withAlpha(50),
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
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                          height: 100,
                          width: 160,
                          decoration: BoxDecoration(
                            color:
                                CustomResource.primaryGreenLight.withAlpha(70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: document3 == null
                              ? const Icon(
                                  Icons.photo_camera,
                                  color: Colors.white,
                                )
                              : Stack(children: [
                                  Image.file(
                                    document3!,
                                    fit: BoxFit.cover,
                                  ),
                                  Column(
                                    children: const [
                                      Center(
                                        child: Text(
                                          "Text is Here ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      )
                                    ],
                                  )
                                ])),
                    ))),
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
                section = 3;
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
        children: [
          const Text(
            "Terms and Conditions",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomResource.primaryGreenLight,
                fontSize: 16),
          ),
          const SizedBox(
            height: 21,
          ),
          const Text(
            "General",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Welcome to Share Drive SL. \n"
            "This applications has been developed in order to help citizens"
            " of Sri Lanka to accommodate their day to day transportation needs \n"
            "This application must only used to cover up your fuel fees and rates should be calculated according to fuel consumption. \n"
            "This application can't be used for any type of commercial use or as any type of income source\n"
            "This application will not motivate you to serve as a driver, We motivate you to share your vehicle when you are comfortable to "
            "share it and help the community while helping your self with fuel fee. \n\n"
            "Provided user verifications documentations will be securely saved on our servers and would not be provided to any individual user directly "
            "in any circumstances. These data  would be provided to respective secure authorities in case of a proven scenario of legal case documented on respective authority.",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 12),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                _launchInWebViewOrVC(Uri(
                    scheme: 'https',
                    host: 'jrcmadushanka.github.io',
                    path: 'share_drive_policies'));
              },
              child: const Text("Read Privacy Policy",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomResource.primaryGreen))),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Checkbox(
                value: userAgreed,
                onChanged: (value) => setState(() {
                  userAgreed = !userAgreed;
                }),
                fillColor:
                    MaterialStateProperty.all(CustomResource.primaryGreen),
              ),
              const Expanded(
                  child: Text(
                "I agree to above Privacy Policy, and Terms & Conditions",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomResource.primaryGreen),
                maxLines: 2,
              )),
            ],
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: DefaultButton("Register", () {
              if (userAgreed) {
                registerUser();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    "Please accept the privacy policy before register",
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.amber,
                ));
              }
            }, enabled: userAgreed),
          ),
          TextButton(
              onPressed: () => setState(() {
                    section = 2;
                    userAgreed = false;
                  }),
              child: const Text("Back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomResource.primaryGreen)))
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

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  registerUser() async {
    firebaseService
        .signUp(emailFieldController.text, passwordFieldController.text)
        .then((value) async {
      await Future.wait<void>([
        uploadFile(document2!, "dp", value?.uid ?? "discard"),
        uploadFile(document1!, "vd1", value?.uid ?? "discard"),
        uploadFile(document3!, "vd2", value?.uid ?? "discard"),
        firebaseService
            .registerUser(
                value?.uid ?? "nil",
                firstNameFieldController.text,
                lastNameFieldController.text,
                phoneFieldController.text,
                emailFieldController.text,
                ApplicationConstants.userStatusNew,
                addressFieldController.text,
                verificationType,
                "",
                "",
                "",
                userAgreed)
            .onError((String? error, StackTrace? stackTrace) =>
                showSnackBar(error ?? "Something went wrong!", Colors.amber))
      ]).then((value) => {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => const AuthenticationScreen(
                screenType:
                AuthenticationScreen.authScreenTypeLogin)))
      });
    }).onError((String? error, StackTrace? stackTrace) =>
            showSnackBar(error ?? "Something went wrong!", Colors.amber));
  }

  showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: color,
    ));
  }

  Future uploadFile(File? file, String type, String id) {
    var completer = Completer<void>();

    if (file != null) {
      firebaseService
          .uploadFile(file, type, id)
          .snapshotEvents
          .listen((taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 *
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            print("Upload is $progress% complete.");
            break;
          case TaskState.paused:
            print("Upload is paused.");
            break;
          case TaskState.canceled:
            print("Upload was canceled");
            break;
          case TaskState.error:
            completer.completeError("Upload Error");
            break;
          case TaskState.success:
            completer.complete();
            break;
        }
      });
    } else {
      completer.completeError("Invalid File");
    }

    return completer.future;
  }
}
