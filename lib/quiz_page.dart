import 'package:flutter/material.dart';

import './question.dart';
import './quiz.dart';
import './question_text.dart';
import './answer.dart';
import './correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question('Flutter is developed by Facebook', false),
    new Question('Cat is human', false),
    new Question('React Native is developed by Facebook', true),
    new Question('Lion is Animal', true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.questions;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answers == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () => handleAnswer(true)),
            QuestionText(questionText, questionNumber),
            AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayVisible == true
            ? new CorrectWrongOverlay(isCorrect, () {
                if (quiz.length == questionNumber) {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new ScorePage(quiz.score, quiz.length)));
                  return;
                }
                currentQuestion = quiz.nextQuestion;
                this.setState(() {
                  overlayVisible = false;
                  questionText = currentQuestion.questions;
                  questionNumber = quiz.questionNumber;
                });
              })
            : new Container()
      ],
    );
  }
}
