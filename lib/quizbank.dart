import 'dart:developer';

import 'questionanswer.dart';

class QuizBank{

  int _qNumber = 0;
  
  final List<QuestionsAndAnswer> _questionBank = [
    QuestionsAndAnswer(q: "The Earth is flat", a: false),
    QuestionsAndAnswer(q: "The capital of France is Paris", a: true),
    QuestionsAndAnswer(
        q: "The largest ocean in the world is the Atlantic Ocean", a: false),
    QuestionsAndAnswer(
        q: "The tallest mountain in the world is Mount Everest", a: true),
    QuestionsAndAnswer(
        q: "California is home to the “Desert of Death", a: false),
    QuestionsAndAnswer(
        q: "Humans lose an average of 75 hairs from their head each month",
        a: false),
    QuestionsAndAnswer(q: "You can sneeze during your sleep", a: false),
    QuestionsAndAnswer(
        q: "The star sign Aquarius is represented by a tiger", a: false),
    QuestionsAndAnswer(
        q: "‘A’ is the most common letter used in the English language",
        a: false),
    QuestionsAndAnswer(
        q: "A cross between a horse and a zebra is called a ‘Hobra’", a: false),
  ];

  void incrementQuestionNumber(){
    if(_qNumber < _questionBank.length - 1){
      _qNumber ++;
      log(_qNumber.toString());
      log(_questionBank.length.toString());
    }
  }

  bool ifQFinished(){
    if(_qNumber == _questionBank.length -  1){
      return true;
    }else{
      return false;
    }
  }

  void resetQuestion(){
    _qNumber = 0;
  }

  String getQuestion(){
    return _questionBank[_qNumber].quest;
  }

  bool getAnswer(){
    return _questionBank[_qNumber].ans;
  }
}