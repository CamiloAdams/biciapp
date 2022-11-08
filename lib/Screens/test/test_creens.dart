import 'package:biciapp/Screens/test/components/test_screen_body.dart';
import 'package:biciapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/questions_provider.dart';
import '../../providers/score_provider.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final questionsProvider = Provider.of<QuestionsProvider>(context);
    final scoreProvider = Provider.of<ScoreProvider>(context);
    return Scaffold(
      body: TestScreenBody(
        questionsProvider: questionsProvider,
        scoreProvider: scoreProvider,
      ),
      backgroundColor: kPrimaryLightColor,
    );
  }
}
