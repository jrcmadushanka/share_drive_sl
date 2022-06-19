import 'package:flutter/material.dart';

import '../../utilities/custom_resources.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final void Function()? onClick;
  final bool enabled;

  const DefaultButton(this.text, this.onClick, {Key? key, this.enabled = true,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: getButtonStyle(),
          onPressed:onClick,
          child: Text(text, textScaleFactor: 1.1),
        ));
  }

  getButtonStyle() {
    return OutlinedButton.styleFrom(
      primary: Colors.white,
      backgroundColor: enabled ? CustomResource.primaryGreen : CustomResource.primaryGreenGray ,
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
}
