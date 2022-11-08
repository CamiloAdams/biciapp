import 'package:biciapp/interfaces/question.dart';
import 'package:flutter/material.dart';

class QuestionsProvider extends ChangeNotifier {
  bool _load = false;
  List<Question> _questions = [];
  Question _question = Question(
    id: '',
    pregunta: '',
    respuesta: false,
    imgURL: '',
  );

  List<Question> get questions {
    return _questions;
  }

  set questions(List<Question> questions) {
    _questions = questions;
    notifyListeners();
  }

  bool get load {
    return _load;
  }

  set load(bool load) {
    _load = load;
    notifyListeners();
  }

  Question get question {
    return _question;
  }

  set question(Question question) {
    _question = question;
    notifyListeners();
  }
}
