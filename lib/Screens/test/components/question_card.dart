import 'package:biciapp/interfaces/guide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/question.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          image: DecorationImage(
              alignment: Alignment(-.2, 0),
              image: NetworkImage(question.imgURL),
              fit: BoxFit.cover)),
      alignment: Alignment.center,
      // child: FittedBox(
      //   fit: BoxFit.cover,
      //   child: Image.network(question.imgURL),
      // ),
    );
  }
}
