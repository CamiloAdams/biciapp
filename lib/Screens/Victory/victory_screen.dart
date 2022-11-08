import 'package:biciapp/components/background.dart';
import 'package:biciapp/constants.dart';
import 'package:biciapp/providers/questions_provider.dart';
import 'package:biciapp/providers/score_provider.dart';
import 'package:biciapp/services/score.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/token_provider.dart';

class VictoryScreen extends StatelessWidget {
  static const _estiloTitulo = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
  static late int score;
  static late String text;
  const VictoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);
    final questionsProvider = Provider.of<QuestionsProvider>(context);
    final scoreProvider = Provider.of<ScoreProvider>(context);
    ScoreService scoreService = ScoreService(token: tokenProvider.token);
    score = scoreProvider.score;
    text = (score == questionsProvider.questions.length)
        ? '!Bien Hecho!'
        : 'Buen Intento';

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Spacer(),
              Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    _crearTitulo(text),
                    const SizedBox(
                      height: defaultPadding * 4,
                    ),
                    Text(
                        'Has respondido ${score} de ${questionsProvider.questions.length} preguntas.'),
                    const SizedBox(
                      height: defaultPadding * 2,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CupertinoColors.activeGreen),
                      onPressed: () {
                        scoreService.addScore(score);
                        Navigator.pushNamed(context, 'home');
                      },
                      child: Text(
                        'aceptar'.toUpperCase(),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer()
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearTitulo(String title) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(title.toUpperCase(), style: _estiloTitulo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearTexto(String text) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          text,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
