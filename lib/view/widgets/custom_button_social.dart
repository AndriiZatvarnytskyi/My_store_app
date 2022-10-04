import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final void Function()? onPressed;
  const CustomButtonSocial(
      {required this.text, required this.imageName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade100),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(
              imageName,
              height: 25,
              width: 25,
            ),
            SizedBox(
              width: 90,
            ),
            CustomText(
              text: text,
            ),
          ],
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
      ),
    );
  }
}
