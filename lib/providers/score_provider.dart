import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int _score = 0;

  int get score {
    return this._score;
  }

  set score(int score) {
    this._score = score;
    notifyListeners();
  }
}
