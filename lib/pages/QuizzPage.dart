import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/main.dart';
import 'package:quizz/models/datas.dart';
import 'package:quizz/models/question.dart';
import 'package:quizz/widgets/CustomImageView.dart';
import 'package:quizz/widgets/CustomText.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const CustomText(
          textString: "Le Quizz",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
              textString: paginationDisplay,
              color: appColor,
              factor: 1.4,
            ),
            CustomText(
              textString: scoreDisplay,
              color: appColor,
              factor: 1.4,
            ),
            CustomImageView(
              dHeight: size.width * 0.8,
              dWidth: size.width * 0.8,
              sImagePath: currentQuestion.getImage(),
            ),
            CustomText(
              textString: currentQuestion.question,
              color: Colors.grey[900] as Color,
              factor: 1.6,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                answerButton(answer: true),
                answerButton(answer: false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton answerButton({required bool answer}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: (answer) ? Colors.greenAccent : Colors.redAccent,
          elevation: 10.0),
      onPressed: () {
        onQuizzPressed(true);
      },
      child: Text(
        (answer) ? "VRAI" : "FAUX",
        style: const TextStyle(color: textColor),
      ),
    );
  }

  onQuizzPressed(bool choice) {
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
      contentPadding: const EdgeInsets.all(10),
      children: [
        CustomText(
          textString: (resultat) ? "C'est gagné!" : "Oups! perdu...",
          color: (resultat) ? Colors.green : Colors.red,
          factor: 1.4,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(
          height: 15,
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
                child: CustomText(
                  textString: currentQuestion.explication,
                  color: Colors.black,
                  factor: 1.1,
                  fontWeight: FontWeight.w400,
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
        ElevatedButton(
          onPressed: () {
            nextQuestion(response: resultat);
          },
          style: ElevatedButton.styleFrom(backgroundColor: appColor),
          child: const CustomText(
            textString: "Passer à la question suivante",
            factor: 1.1,
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
