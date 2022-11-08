import 'package:biciapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/guides_provider.dart';

class GuideDetailScreen extends StatelessWidget {
  static const _estiloTitulo = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  const GuideDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guidesProvider = Provider.of<GuidesProvider>(context);
    String title = guidesProvider.guide.nombre;
    List<dynamic> texto = guidesProvider.guide.texto;
    List<dynamic> imagenes = guidesProvider.guide.imagenes;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearTitulo(title),
            Column(
              children: _getBody(context, texto, imagenes),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearTitulo(String title) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(title, style: _estiloTitulo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getBody(
      BuildContext context, List<dynamic> texto, List<dynamic> imagenes) {
    List<Widget> body = <Widget>[];
    int i = 0;
    for (i = 0; i < texto.length; i++) {
      body.add(_crearTexto(texto[i]));
      body.add(
        const SizedBox(height: defaultPadding),
      );
      body.add(_crearImagen(context, imagenes[i]));
      body.add(
        const SizedBox(height: defaultPadding),
      );
    }
    return body;
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

  Widget _crearImagen(BuildContext context, String imgURL) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: FadeInImage.assetNetwork(
        image: imgURL,
        height: 200.0,
        fit: BoxFit.cover,
        placeholder: 'assets/images/loading.gif',
      ),
    );
  }
}
