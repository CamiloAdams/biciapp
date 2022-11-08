import 'package:biciapp/interfaces/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../providers/token_provider.dart';
import '../../../services/auth.service.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late String userName;
  late String nombre;
  late String apellido;
  late String fechaNacimiento;
  late String email;
  late String password;

  TextEditingController dateinput = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);
    final AuthService authService = AuthService(tokenProvider);

    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (value) {
              userName = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Nombre de usuario",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              onSaved: (newValue) {
                nombre = newValue!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Nombre",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.assignment_ind),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              onSaved: (newValue) {
                apellido = newValue!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Apellido",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.assignment_ind),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
              controller: dateinput,
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.done,
              readOnly: true,
              cursorColor: kPrimaryColor,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(DateTime.now().year - 12),
                    firstDate: DateTime(DateTime.now().year -
                        80), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(DateTime.now().year - 12),
                    builder: ((context, child) {
                      return Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                            primary: kPrimaryColor,
                          )),
                          child: child!);
                    }));
                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    fechaNacimiento = formattedDate;
                    dateinput.text = formattedDate;
                  });
                } else {
                  print("Date is not selected");
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Fecha De Nacimiento",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.calendar_month),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              onSaved: (newValue) {
                email = newValue!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.alternate_email),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              obscureText: true,
              onSaved: (newValue) {
                password = newValue!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Contraseña",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () async {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                var auth = await authService.register(User(
                    username: userName,
                    nombres: nombre,
                    apellidos: apellido,
                    fechaNacimiento: fechaNacimiento,
                    email: email,
                    password: password));
                if (tokenProvider.token.isNotEmpty) {
                  print('lograo');
                  Navigator.pushReplacementNamed(context, 'home');
                }
              }
            },
            child: Text("Registrarse".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
