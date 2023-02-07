import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/main.dart';
import 'package:quizz/quizzpage.dart';
import 'package:quizz/widgets/CustomText.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String imagePath = "assets/cover.jpg";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Quizz vrai ou faux"),
      ),
      body: Center(
        child: Container(
          child: Card(
            color: cardColr,
            elevation: 8,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      imagePath,
                      height: height / 2.5,
                      width: width * 0.8,
                      fit: BoxFit.fill,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: appColor),
                    onPressed: () {
                      openQuizzPage();
                    },
                    child: const CustomText(
                      textString: "Commencer le Quizz",
                      factor: 1.5,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  openQuizzPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext ctx) {
      return QuizzPage();
    }));
  }
}
