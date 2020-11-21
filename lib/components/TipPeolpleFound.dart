import 'package:flutter/material.dart';
import 'InformationsFound.dart';
import '../classes/Dica.dart';

// ignore: must_be_immutable
class TipPeolpleFound extends StatelessWidget {
  TipPeolpleFound(this.data); /* Esse é o creator que vai receber os dados */
  Dica data;

  @override
  Widget build(BuildContext context) {
  print('data: $data');
    return Card(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: InformationsFound(
                  // '${data.dataCriacao}',
                  '17/11/2020',
                  50,
                  Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                      size: 20.0,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: InformationsFound(
                  '${data.user.nome}',
                  50,
                  Icon(
                      Icons.account_circle,
                      color: Colors.black,
                      size: 20.0,
                  ),
                ),
              )
            ]
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: InformationsFound(
                  '${data.user.telefone}',
                  50,
                  Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 20.0,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: InformationsFound(
                  '${data.user.email}',
                  50,
                  Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 20.0,
                  ),
                ),
              ),
            ]
          ),
          InformationsFound(
            data.mensagemDeAviso,
            50,
            Icon(
                Icons.warning,
                color: Colors.black,
                size: 20.0,
            ),
          ),
          Card (
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  data.endereco.imageUrl,
                  width: 300,
                  height: 65,
                  fit: BoxFit.cover
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                  size: 32.0,
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}
