import 'dart:convert';

class Auth {
  final String token;
  final List roles;

  const Auth({required this.token, required this.roles});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(token: json['token'], roles: json['roles']);
  }
}
