import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InformationsFound extends StatelessWidget {
  InformationsFound(this.data, this.heightForField, this.icon); /* Esse é o creator que vai receber os dados */
    var data;
    var heightForField;
    Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row (
      children: [
        Container(
          height: 30.0,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: icon
        ),
        Expanded(
          child: Text(
            data,
          ),
        )
      ],
    );
  }
}