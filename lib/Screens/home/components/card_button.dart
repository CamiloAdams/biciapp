import 'package:biciapp/constants.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String image;
  final String buttonText;
  final String route;
  const CardButton(
      {super.key,
      required this.image,
      required this.buttonText,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Card(
            color: kPrimaryLightColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(image)),
          ),
        ),
        SizedBox(
          height: defaultPadding / 2,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          child: Text(
            buttonText.toUpperCase(),
          ),
        )
      ],
    );
  }
}
