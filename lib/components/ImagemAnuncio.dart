import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImagemAnuncio extends StatelessWidget {
  ImagemAnuncio(this.imagem, this.nome, this.idade);
  var imagem;
  var nome;
  var idade;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(children: <Widget>[
          Image.network(
              imagem,
              height: 300,
              fit: BoxFit.fitWidth),
          Text(
            '$nome, $idade',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 25),
          ),
          // Text(
          //   "34 anos",
          //   style: TextStyle(fontSize: 22),
          // ),
        ]),
      ),
    );
  }
}