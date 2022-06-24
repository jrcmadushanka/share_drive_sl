import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_drive_sl/utilities/custom_resources.dart';

class DefaultTextField extends StatelessWidget {
  final String hint;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final String? prefix;
  final bool? isSecure;
  final TextInputType? type;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;

  const DefaultTextField(this.hint,
      {Key? key,
      this.minLines = 1,
      this.maxLines = 1,
      this.maxLength,
      this.onChange,
      this.isSecure,
      this.type,
      this.controller,
      this.inputFormatter,
      this.validator,
      this.prefix})
      : super(key: key);

  @override
  TextFormField build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          color: CustomResource.primaryGreen, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: CustomResource.primaryGreen, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: CustomResource.primaryGreenLight, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        prefixText: prefix ,
        prefixStyle: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        hintText: hint,
        hintStyle: const TextStyle(
            color: CustomResource.primaryGreenLight, fontSize: 12),
      ),
      onChanged: onChange,
      obscureText: isSecure ?? false,
      keyboardType: type,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      inputFormatters: inputFormatter,
      validator: validator,
    );
  }
}
