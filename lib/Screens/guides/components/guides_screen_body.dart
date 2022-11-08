import 'package:biciapp/Screens/guides/components/guide_tile.dart';
import 'package:biciapp/interfaces/guide.dart';
import 'package:flutter/material.dart';
import 'package:biciapp/providers/guides_provider.dart';
import 'package:provider/provider.dart';

class GuidesScreenBody extends StatelessWidget {
  const GuidesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final guidesProvider = Provider.of<GuidesProvider>(context);
    List<Guide> guides = guidesProvider.guides;
    return ListView.separated(
      itemCount: guides.length,
//construye la lista
      itemBuilder: (context, index) =>
          GuideTile(guide: guides[index]), // Separador de la lista
      separatorBuilder: (_, index) => const Divider(),
    );
  }
}
