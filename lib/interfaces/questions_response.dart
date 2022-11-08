import 'dart:convert';

import 'package:biciapp/interfaces/question.dart';

class QuestionsResponse {
  List<Question> questions;

  QuestionsResponse({required this.questions});

  factory QuestionsResponse.fromJson(String str) =>
      QuestionsResponse.fromMap(jsonDecode(str));

  factory QuestionsResponse.fromMap(List<dynamic> json) => QuestionsResponse(
      questions: List<Question>.from(json.map((x) => Question.fromJson(x))));
}
