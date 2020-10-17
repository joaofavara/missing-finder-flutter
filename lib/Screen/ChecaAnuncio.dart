import 'package:flutter/material.dart';

// TELA PRA QUANDO CLICA VER UM ANÚNCIO DA HOME

class ChecaAnuncio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Missing Finder",),
        centerTitle: true,
      ),

      // BODY => GRID COM AS FOTOS
      body: GridView.count(
        crossAxisCount: 1, //Grid com 2 colunas
        children: List.generate(1, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: (
              Image.asset('assets/imagens/katyperry_similaridades.jpg', 
              width: 500, height: 500,fit: BoxFit.cover)
            ),
          );
        }),
      ),
    );
  }
}
