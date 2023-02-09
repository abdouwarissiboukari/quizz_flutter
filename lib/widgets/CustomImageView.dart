import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/main.dart';

class CustomImageView extends StatelessWidget {
  final double dHeight;
  final double dWidth;
  final String sImagePath;

  const CustomImageView(
      {super.key,
      required this.dHeight,
      required this.dWidth,
      required this.sImagePath});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColr,
      elevation: 8,
      child: SizedBox(
        height: dHeight,
        width: dWidth,
        child: Image.asset(
          sImagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
