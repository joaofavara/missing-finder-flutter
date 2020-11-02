import 'package:flutter/material.dart';

// TELA PARA CHECAR ANUNCIO DAS PESSOAS ACHADAS
class ChecaAnuncio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Missing Finder",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: (
          Image.network("https://uploaddeimagens.com.br/imagens/Y-bLBYM")
        ),
      ),
    );
  }
}
