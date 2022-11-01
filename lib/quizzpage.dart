import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/datas.dart';
import 'package:quizz/main.dart';
import 'package:quizz/question.dart';

class QuizzPage extends StatefulWidget {
  @override
  QuizzPageState createState() => QuizzPageState();
}

class QuizzPageState extends State<QuizzPage> {
  late int score;
  late int pagination;
  late String scoreDisplay;
  late String paginationDisplay;
  List<Question> listeQuestions = Datas().listeQuestions;
  late Question currentQuestion;

  @override
  void initState() {
    super.initState();
    score = 0;
    pagination = 1;
    scoreDisplay = "Score $score";
    paginationDisplay = "Question numéro: $pagination/${listeQuestions.length}";
    currentQuestion = listeQuestions.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text(
          scoreDisplay,
          style: const TextStyle(color: textColor),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    paginationDisplay,
                    style: const TextStyle(color: appColor, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7),
                  child: Text(
                    currentQuestion.question,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7),
                  child: Image.asset(
                    currentQuestion.getImage(),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      answerButton(answer: false),
                      answerButton(answer: true),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton answerButton({required bool answer}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: (answer) ? Colors.greenAccent : Colors.redAccent,
      ),
      onPressed: () {
        onQuizzPressed(choice: true);
      },
      child: Text(
        (answer) ? "VRAI" : "FAUX",
        style: const TextStyle(color: textColor),
      ),
    );
  }

  onQuizzPressed({required bool choice}) {
    setState(() {
      if (choice == currentQuestion.reponse) {
        showResultDialog(result: true, dialog: 1);
      } else {
        showResultDialog(result: false, dialog: 1);
      }
    });
  }

  Future<void> showResultDialog(
      {required bool result, required int dialog}) async {
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          if (dialog == 1) {
            return quizzShowDialog(resultat: result);
          } else {
            return endAlert();
          }
        });
  }

  SimpleDialog quizzShowDialog({required bool resultat}) {
    return SimpleDialog(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 10,
            bottom: 10,
          ),
          child: Text(
            (resultat) ? "C'est gagné!" : "Raté!",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 7,
          ),
          child: Image.asset(
            (resultat) ? "assets/vrai.jpg" : "assets/faux.jpg",
            fit: BoxFit.fill,
          ),
        ),
        (currentQuestion.explication.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  currentQuestion.explication,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
        TextButton(
          onPressed: () {
            nextQuestion(response: resultat);
          },
          child: const Text(
            "Passer à la question suivante",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }

  nextQuestion({required bool response}) {
    if (pagination < listeQuestions.length) {
      setState(() {
        if (response) {
          score++;
          scoreDisplay = "Score $score";
        }
        pagination++;
        paginationDisplay =
            "Question numéro: $pagination/${listeQuestions.length}";
        currentQuestion = listeQuestions.elementAt(pagination - 1);
      });

      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      showResultDialog(result: true, dialog: 2);
    }
  }

  AlertDialog endAlert() {
    return AlertDialog(
      title: const Text(
        "C'est fini !",
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      content: Text(
        "Votre score est de : $score",
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
      ],
    );
  }
}
