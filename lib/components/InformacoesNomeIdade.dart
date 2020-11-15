import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InformacoesNomeIdade extends StatelessWidget {
  InformacoesNomeIdade(this.data, this.heightForField); /* Esse é o creator que vai receber os dados */
    var data;
    var heightForField;

  @override
  Widget build(BuildContext context) {
    return Container (
      height: heightForField,
      width: 50,
      child: Card(
        color: Colors.red,
        child: Row (
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   margin: const EdgeInsets.all(20.0),
            // ),
            Text(
              data,
            ),
          ],
        )
      ),
    );
  }
}