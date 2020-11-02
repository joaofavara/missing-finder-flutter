import 'package:flutter/material.dart';

// TELA PARA CHECAR ANUNCIO DAS PESSOAS PERDIDAS
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

      // BODY => GRID COM AS FOTOS
      body: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        //padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/imagens/katyperry_similaridades.jpg',
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ],
            ),
            // NOME DA PESSOA DESAPARECIDA
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 0,
              ),
              child: Text(
                'KATHERINE PERRY',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),

            // Mensagem deixada pela família
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: Text(
                'Katherine, volte para casa! Estamos a sua procura',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),

            // MAPA COM A GEOLOCALIZAÇÃO
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: Text(
                'MAPA DA GEOLOCALIZAÇÃO',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
