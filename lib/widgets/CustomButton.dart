import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/main.dart';
import 'package:quizz/widgets/CustomText.dart';

class CustomButton extends StatelessWidget {
  String sText;
  bool bType;
  double dFactor;
  Color cColor;
  Function(bool)? onButtonPressed;
  CustomButton({
    super.key,
    required this.onButtonPressed,
    required this.sText,
    this.bType = true,
    this.dFactor = 1.5,
    this.cColor = appColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: cColor),
      onPressed: () {
        onButtonPressed;
      },
      child: CustomText(
        textString: sText,
        factor: dFactor,
      ),
    );
  }
}
