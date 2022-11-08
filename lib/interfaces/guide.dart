class Guide {
  String id;
  String nombre;
  List<dynamic> texto;
  List<dynamic> imagenes;

  Guide(
      {required this.id,
      required this.nombre,
      required this.imagenes,
      required this.texto});

  factory Guide.fromJson(Map<String, dynamic> json) {
    return Guide(
        id: json['_id'],
        nombre: json['nombre'],
        imagenes: json['imagenes'],
        texto: json['texto']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = id;
    data['nombre'] = nombre;
    data['texto'] = texto;
    data['imagenes'] = imagenes;
    return data;
  }
}
