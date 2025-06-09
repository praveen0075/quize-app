import 'package:flutter/material.dart';
import 'package:quiz_app/quizbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBank qbank = QuizBank();

void main() {
  runApp(const QuizeApp());
}

class QuizeApp extends StatelessWidget {
  const QuizeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz app',
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizHomePage(),
        )),
      ),
    );
  }
}

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  List<Icon> scoreKeeper = [];

  void checkTheAnswer(bool userSelectedAnswer) {
    bool correctAnswer = qbank.getAnswer();
    setState(() {
      if (qbank.ifQFinished()) {
        Alert(
                context: context,
                title: "Finished",
                desc: "You are successfully finished the quiz")
            .show();
            qbank.resetQuestion();
            scoreKeeper = [];
      } else {
        if (correctAnswer == userSelectedAnswer) {
          qbank.incrementQuestionNumber();
          scoreKeeper.add(Icon(
            Icons.done,
            color: Colors.green,
          ));
        } else {
          qbank.incrementQuestionNumber();
          scoreKeeper.add(Icon(
            Icons.clear,
            color: Colors.red,
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              qbank.getQuestion(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    shape: BeveledRectangleBorder(),
                    backgroundColor: Colors.green),
                onPressed: () {
                  checkTheAnswer(true);
                },
                child: Text(
                  "True",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    shape: BeveledRectangleBorder(),
                    backgroundColor: Colors.red),
                onPressed: () {
                  checkTheAnswer(false);
                },
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}
