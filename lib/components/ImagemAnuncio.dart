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
        child: Column(children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Image.network(
                  imagem,
                  height: 300,
                  fit: BoxFit.fitWidth),
                  ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding (
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Align (
                    alignment: Alignment.center,
                    child: Text(
                      '$nome, $idade',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                )
              ),
            ],
          ),
        ]),
      ),
    );
  }
}