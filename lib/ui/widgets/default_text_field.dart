
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_drive_sl/utilities/custom_resources.dart';

class DefaultTextField extends StatelessWidget {

  final String hint;
  final void Function(String)? onChange;
  final bool isSecure;
  final TextInputType type;

  const DefaultTextField(this.hint, this.onChange, this.isSecure , this.type, {Key? key}) : super(key: key);

  @override
  TextField build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: CustomResource.primaryGreen, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomResource.primaryGreen, width: 2.0), borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomResource.primaryGreenLight, width: 1.0), borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: CustomResource.primaryGreenLight, fontSize: 12),
      ),
      onChanged: onChange,
      obscureText: isSecure,
      keyboardType: type,
    );
  }
}
