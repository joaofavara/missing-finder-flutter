import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Informacoes extends StatelessWidget {
  Informacoes(this.data, this.heightForField, this.icon); /* Esse é o creator que vai receber os dados */
    var data;
    var heightForField;
    Icon icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container (
        height: heightForField,
        child: Card(
          color: Colors.blue[200].withOpacity(0.8),
          child: Row (
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: icon
              ),
              Expanded(
                child: Text(
                  data,
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}