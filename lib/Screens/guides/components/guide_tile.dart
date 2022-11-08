import 'package:biciapp/constants.dart';
import 'package:biciapp/interfaces/guide.dart';
import 'package:biciapp/interfaces/user.dart';
import 'package:biciapp/providers/token_provider.dart';
import 'package:biciapp/services/user.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/guides_provider.dart';

class GuideTile extends StatelessWidget {
  final Guide guide;
  const GuideTile({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    final guidesProvider = Provider.of<GuidesProvider>(context);
    final tokenProvider = Provider.of<TokenProvider>(context);
    UserService userService = UserService(token: tokenProvider.token);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(guide.nombre),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: (() {
          Future<String> response = userService.addGuide(guide.id);
          guidesProvider.guide = guide;
          Navigator.pushNamed(context, 'detail_screen');
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
