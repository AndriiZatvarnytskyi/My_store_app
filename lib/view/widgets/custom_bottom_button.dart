import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/constance.dart';
import 'package:my_app/view/widgets/custom_text.dart';

import 'custom_button.dart';

class CustomBottomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double fontSize;

  final void Function()? onPressed;
  const CustomBottomButton(
      {required this.text,
      required this.onPressed,
      required this.color,
      this.fontSize = 20,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
            border: Border.all(width: 3, color: primaryColor)),
        width: 150,
        height: 60,
        margin: EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: TextButton(
            child: CustomText(
              alignment: Alignment.center,
              text: text,
              color: textColor,
              fontSize: fontSize,
            ),
            onPressed: onPressed));
  }
}