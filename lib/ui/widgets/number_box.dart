import 'package:flutter/material.dart';

import '../../utilities/custom_resources.dart';

class NumberBox extends StatelessWidget {
  const NumberBox({
    Key? key, required this.number, required this.isSelected,
  }) : super(key: key);

  final String number;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: isSelected ? CustomResource.primaryGreenDark : CustomResource.primaryGreen,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      alignment: Alignment.center,
      child: Text(
        number,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}