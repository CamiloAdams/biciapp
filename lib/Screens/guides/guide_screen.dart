import 'package:biciapp/Screens/guides/components/guides_screen_body.dart';
import 'package:biciapp/constants.dart';
import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Guías'),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GuidesScreenBody(),
        color: Colors.grey[100],
      ),
    );
  }
}
