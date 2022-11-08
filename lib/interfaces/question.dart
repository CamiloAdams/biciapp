class Question {
  String id;
  String pregunta;
  bool respuesta;
  String imgURL;

  Question(
      {required this.id,
      required this.pregunta,
      required this.respuesta,
      required this.imgURL});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json['_id'],
        pregunta: json['pregunta'],
        respuesta: json['respuesta'],
        imgURL: json['imgURL']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = id;
    data['pregunta'] = pregunta;
    data['respuesta'] = respuesta;
    data['imgURL'] = imgURL;
    return data;
  }
}
