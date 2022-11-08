import 'dart:async';
import 'dart:convert';

import 'package:biciapp/interfaces/guides_response.dart';
import 'package:biciapp/interfaces/questions_response.dart';
import 'package:biciapp/providers/guides_provider.dart';
import 'package:biciapp/providers/questions_provider.dart';
import 'package:http/http.dart' as http;

import '../providers/token_provider.dart';

class QuestionsService {
  final String url = 'http://bicijuego.online:3000/api/questions';

  final TokenProvider tokenProvider;
  final QuestionsProvider questionsProvider;

  late Map<String, String> headers;

  QuestionsService(
      {required this.tokenProvider, required this.questionsProvider}) {
    headers = {
      'Content-Type': 'application/json',
      'x-access-token': tokenProvider.token
    };
  }

  Future<QuestionsResponse> getQuestions() async {
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode != 200) {
      return QuestionsResponse(questions: []);
    }
    final responseJson = jsonDecode(response.body);
    print(responseJson);
    QuestionsResponse questions = QuestionsResponse.fromJson(response.body);
    questionsProvider.question = questions.questions[0];

    questionsProvider.questions = questions.questions;
    questionsProvider.load = true;

    return questions;
  }
}
