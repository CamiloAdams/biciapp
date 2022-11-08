import 'dart:async';
import 'dart:convert';

import 'package:biciapp/interfaces/guides_response.dart';
import 'package:biciapp/providers/guides_provider.dart';
import 'package:http/http.dart' as http;

import '../providers/token_provider.dart';

class GuidesService {
  final String url = 'http://bicijuego.online:3000/api/guides';

  final TokenProvider tokenProvider;
  final GuidesProvider guidesProvider;

  late Map<String, String> headers;

  GuidesService({required this.tokenProvider, required this.guidesProvider}) {
    headers = {
      'Content-Type': 'application/json',
      'x-access-token': tokenProvider.token
    };
  }

  Future<GuidesResponse> getGuides() async {
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode != 200) {
      return GuidesResponse(guides: []);
    }
    final responseJson = jsonDecode(response.body);
    print(responseJson);
    // _tokenProvider.token = responseJson["token"];
    GuidesResponse guides = GuidesResponse.fromJson(response.body);
    guidesProvider.guides = guides.guides;
    guidesProvider.load = true;

    return guides;
  }
}
