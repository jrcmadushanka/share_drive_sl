import 'package:flutter/material.dart';

import '../../utilities/custom_resources.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final void Function()? onClick;

  DefaultButton(this.text, this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: outlineButtonStyle,
          onPressed: onClick,
          child: Text(text, textScaleFactor: 1.1),
        ));
  }

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    primary: Colors.white,
    backgroundColor: CustomResource.primaryGreen,
    minimumSize: const Size(280, 47),
    textStyle: const TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),

    ),
  ).copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return const BorderSide(
            color: CustomResource.primaryGreenLight,
            width: 2,
          );
        } else {
          return const BorderSide(
            color: Colors.white,
            width: 2,
          );
        }
      },
    ),
  );
}
