import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/main.dart';
import 'package:quizz/pages/QuizzPage.dart';
import 'package:quizz/widgets/CustomPushButton.dart';
import 'package:quizz/widgets/CustomImageView.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String imagePath = "assets/cover.jpg";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Quizz vrai ou faux"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImageView(
              dHeight: size.width * 0.8,
              dWidth: size.width * 0.8,
              sImagePath: imagePath),
          CustomPushButton(sText: "Commencer le Quizz"),
        ],
      )),
    );
  }

  openQuizzPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext ctx) {
        return QuizzPage();
      }),
    );
  }
}
