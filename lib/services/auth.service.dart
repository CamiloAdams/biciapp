import 'dart:async';
import 'dart:convert';

import 'package:biciapp/interfaces/auth.dart';
import 'package:biciapp/interfaces/user.dart';
import 'package:http/http.dart' as http;

import '../providers/token_provider.dart';

class AuthService {
// const url = 'http://192.168.10.121:3000/api/auth/login';
  final String url = 'http://bicijuego.online:3000/api/auth';

  final TokenProvider _tokenProvider;

  AuthService(this._tokenProvider);

  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  Future<Auth> login(email, password) async {
    final response = await http.post(
      Uri.parse("$url/login"),
      body: jsonEncode({"email": email, "password": password}),
      headers: headers,
    );
    if (response.statusCode != 200) {
      return const Auth(token: "", roles: []);
    }
    final responseJson = jsonDecode(response.body);
    print(responseJson);
    _tokenProvider.token = responseJson["token"];
    return Auth.fromJson(responseJson);
  }

  Future<Auth> register(User user) async {
    final response = await http.post(
      Uri.parse('$url/register'),
      body: jsonEncode(user.toJson()),
      headers: headers,
    );
    if (response.statusCode != 200) {
      return const Auth(token: "", roles: []);
    }
    final responseJson = jsonDecode(response.body);
    print(responseJson);

    _tokenProvider.token = responseJson["token"];

    return Auth.fromJson(responseJson);
  }
}
