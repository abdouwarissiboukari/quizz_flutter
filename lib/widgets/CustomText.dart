import 'package:flutter/material.dart';

import '../main.dart';

class CustomText extends StatelessWidget {
  final String textString;
  final Color color;
  final double factor;
  final TextAlign? textAlign;

  const CustomText(
      {super.key,
      required this.textString,
      this.color = textColor,
      this.factor = 1.0,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      style: TextStyle(
        color: color,
      ),
      textScaleFactor: factor,
      textAlign: textAlign,
    );
  }
}
