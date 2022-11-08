import 'package:biciapp/Screens/home/components/card_button.dart';
import 'package:biciapp/constants.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 5,
              child: Column(children: const <Widget>[
                CardButton(
                  route: 'guides',
                  image: 'assets/images/guides.png',
                  buttonText: 'guias',
                ),
                SizedBox(
                  height: defaultPadding * 2,
                ),
                CardButton(
                  route: 'test',
                  image: 'assets/images/test.png',
                  buttonText: 'test',
                ),
              ]),
            ),
            Spacer()
          ],
        )
      ],
    );
  }
}
