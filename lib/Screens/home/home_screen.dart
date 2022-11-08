import 'package:biciapp/Screens/home/components/home_screen_body.dart';
import 'package:biciapp/components/background.dart';
import 'package:biciapp/providers/guides_provider.dart';
import 'package:biciapp/providers/questions_provider.dart';
import 'package:biciapp/services/guides.service.dart';
import 'package:biciapp/services/questions.service.dart';
import 'package:flutter/material.dart';

import 'package:biciapp/providers/token_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);
    final guidesProvider = Provider.of<GuidesProvider>(context);
    final questionsProvider = Provider.of<QuestionsProvider>(context);
    GuidesService guidesService = GuidesService(
        tokenProvider: tokenProvider, guidesProvider: guidesProvider);
    QuestionsService questionsService = QuestionsService(
        tokenProvider: tokenProvider, questionsProvider: questionsProvider);

    if (!guidesProvider.load) {
      guidesService.getGuides();
    }
    if (!questionsProvider.load) {
      questionsService.getQuestions();
    }

    return const Background(child: HomePageBody());
  }
}
