import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  final String url = 'http://bicijuego.online:3000/api/user';

  late Map<String, String> headers;
  String token = '';

  UserService({required this.token}) {
    headers = {'Content-Type': 'application/json', 'x-access-token': token};
  }

  Future<String> addGuide(String guideId) async {
    final response = await http.put(
      Uri.parse("$url/addguide"),
      body: jsonEncode({"id_guia": guideId}),
      headers: headers,
    );
    if (response.statusCode != 200) {
      return 'Guia ya existe';
    }
    final responseJson = jsonDecode(response.body);
    print(responseJson);
    return 'guia nueva';
  }
}
