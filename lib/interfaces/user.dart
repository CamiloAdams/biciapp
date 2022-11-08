class User {
  String username;
  String nombres;
  String apellidos;
  String fechaNacimiento;
  String email;
  String password;

  User(
      {required this.username,
      required this.nombres,
      required this.apellidos,
      required this.fechaNacimiento,
      required this.email,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        nombres: json['nombres'],
        apellidos: json['apellidos'],
        fechaNacimiento: json['fecha_nacimiento'],
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['nombres'] = this.nombres;
    data['apellidos'] = this.apellidos;
    data['fecha_nacimiento'] = this.fechaNacimiento;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
