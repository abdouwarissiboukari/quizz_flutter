import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/main.dart';
import 'package:quizz/quizzpage.dart';

class AppPage extends StatefulWidget {
  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  String imagePath = "assets/cover.jpg";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Quizz Flutter"),
      ),
      body: Center(
        child: Container(
          // margin: const EdgeInsets.only(left: 30, right: 30),
          // height: MediaQuery.of(context).size.height / 2,
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
                    child: const Text(
                      "Commencer le Quizz",
                      style: TextStyle(color: textColor),
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
