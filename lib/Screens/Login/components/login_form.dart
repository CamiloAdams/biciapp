import 'package:biciapp/providers/token_provider.dart';
import 'package:biciapp/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String email;
  late String password;

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
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (value) {
              email = value!;
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
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
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
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  var auth = await authService.login(email, password);
                  if (tokenProvider.token.isNotEmpty) {
                    print('lograo');
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, 'home');
                  }
                }
              },
              child: Text(
                "Ingresar".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
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
