import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ScoreService {
  final String url = 'http://bicijuego.online:3000/api/scores';

  late Map<String, String> headers;
  String token = '';

  ScoreService({required this.token}) {
    headers = {'Content-Type': 'application/json', 'x-access-token': token};
  }

  Future<String> addScore(int score) async {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({"respuestas_correctas": score}),
      headers: headers,
    );
    if (response.statusCode != 200) {
      return 'error';
    }
    final responseJson = jsonDecode(response.body);
    print(responseJson);
    return 'agregado';
  }
}
