import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:biciapp/Screens/test/components/question_card.dart';
import 'package:biciapp/interfaces/question.dart';
import 'package:biciapp/providers/questions_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/score_provider.dart';
import 'buttons.dart';

class TestScreenBody extends StatefulWidget {
  final QuestionsProvider questionsProvider;
  final ScoreProvider scoreProvider;
  const TestScreenBody(
      {Key? key, required this.questionsProvider, required this.scoreProvider})
      : super(key: key);

  @override
  State<TestScreenBody> createState() => _TestScreenBodyState(
      questionsProvider: questionsProvider, scoreProvider: scoreProvider);
}

class _TestScreenBodyState extends State<TestScreenBody> {
  final AppinioSwiperController controller = AppinioSwiperController();
  late int counter = 0;

  List<QuestionCard> cards = [];
  List<Question> questions = [];

  final QuestionsProvider questionsProvider;
  final ScoreProvider scoreProvider;

  _TestScreenBodyState(
      {required this.questionsProvider, required this.scoreProvider});

  @override
  void initState() {
    _loadCards();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadCards() {
    questions = questionsProvider.questions;
    Future.delayed(Duration.zero, () {
      questionsProvider.question = questionsProvider.questions[0];
      scoreProvider.score = 0;
    });

    counter = 0;
    for (Question question in questions.reversed) {
      cards.add(
        QuestionCard(
          question: question,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
        ),
        Container(
          child: Text(questionsProvider.question.pregunta),
          // child: Text(
          //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eget molestie lacus, id pharetra tellus. Duis sem lorem, lacinia id ipsum at, fringilla facilisis eros. Donec in tincidunt nibh'),
          height: MediaQuery.of(context).size.height * 0.10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.60,
          child: AppinioSwiper(
            unlimitedUnswipe: true,
            controller: controller,
            cards: cards,
            onSwipe: _swipe,
            onEnd: _onEnd,
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 50,
              bottom: 40,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            swipeLeftButton(controller),
            const SizedBox(
              width: 20,
            ),
            swipeRightButton(controller),
            const SizedBox(
              width: 20,
            ),
          ],
        )
      ],
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    bool respuesta = direction.name == 'right';
    if (respuesta == questionsProvider.question.respuesta) {
      counter++;
      print(counter);
      if (counter == questions.length) {
        scoreProvider.score = counter;
        Navigator.pushReplacementNamed(context, 'victory');
      } else {
        questionsProvider.question = questionsProvider.questions[counter];
      }
    } else {
      scoreProvider.score = counter;
      Navigator.pushReplacementNamed(context, 'victory');
    }
    log("the card was swiped to the: " + direction.name);
  }

  void _onEnd() {
    log('no mas cartas');
  }
}
