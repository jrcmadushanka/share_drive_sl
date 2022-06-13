import 'package:flutter/material.dart';

import '../../utilities/custom_resources.dart';

class IconSelectableButton extends StatelessWidget {
  const IconSelectableButton({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final String icon;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            margin: const EdgeInsets.only(bottom: 20, top: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: isSelected
                  ? CustomResource.primaryGreen.withAlpha(90)
                  : CustomResource.primaryGreenGray.withAlpha(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageIcon(
                  AssetImage(icon),
                  color: isSelected
                      ? Colors.green
                      : CustomResource.primaryGreen.withAlpha(99),
                  size: 20,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: isSelected
                          ? Colors.green
                          : CustomResource.primaryGreen.withAlpha(99),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )));
  }
}
