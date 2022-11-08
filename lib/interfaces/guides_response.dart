import 'dart:convert';

import 'package:biciapp/interfaces/guide.dart';

class GuidesResponse {
  List<Guide> guides;

  GuidesResponse({required this.guides});

  factory GuidesResponse.fromJson(String str) =>
      GuidesResponse.fromMap(jsonDecode(str));

  factory GuidesResponse.fromMap(List<dynamic> json) => GuidesResponse(
      guides: List<Guide>.from(json.map((x) => Guide.fromJson(x))));
}
