import 'package:flutter/material.dart';

// TELA PRA QUANDO CLICA VER UM ANÚNCIO DA HOME

class ChecaAnuncio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final anuncio = (ModalRoute.of(context).settings.arguments as Map);

    return Scaffold(
      appBar: AppBar(
        title: Text("Missing Finder",),
        centerTitle: true,
      ),

      // BODY => GRID COM AS FOTOS
      body: GridView.count(
        crossAxisCount: 1, //Grid com 2 colunas
        children:[
              Image.network(
                anuncio['url_imagem'], 
                width: 500,
                height: 500,
                fit: BoxFit.cover
              ),
              Text(anuncio.toString()),
        ]
      ),
    );
  }
}
