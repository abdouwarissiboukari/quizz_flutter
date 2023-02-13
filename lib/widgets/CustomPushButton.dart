import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/main.dart';
import 'package:quizz/pages/QuizzPage.dart';
import 'package:quizz/widgets/CustomText.dart';

class CustomPushButton extends StatelessWidget {
  String sText;
  bool bType;
  double dFactor;
  Color cColor;
  CustomPushButton({
    super.key,
    required this.sText,
    this.bType = true,
    this.dFactor = 1.5,
    this.cColor = appColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: cColor),
      onPressed: (() => openQuizzPage(context)),
      child: CustomText(
        textString: sText,
        factor: dFactor,
      ),
    );
  }

  openQuizzPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext ctx) {
        return QuizzPage();
      }),
    );
  }
}
