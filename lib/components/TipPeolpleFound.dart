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
      color: Colors.blue[200].withOpacity(0.8),
      child: Column(children: <Widget>[
        Row(children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: InformationsFound(
              // '${data.dataCriacao}',
              '17/11/2020',
              50,
              Icon(
                Icons.calendar_today,
                color: Colors.blue[800],
                size: 20.0,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: InformationsFound(
              '${data.user.nome}',
              60,
              Icon(
                Icons.account_circle,
                color: Colors.blue[800],
                size: 20.0,
              ),
            ),
          )
        ]),
        Row(children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: InformationsFound(
              '${data.user.telefone}',
              60,
              Icon(
                Icons.phone,
                color: Colors.blue[800],
                size: 20.0,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: InformationsFound(
              '${data.user.email}',
              60,
              Icon(
                Icons.email,
                color: Colors.blue[800],
                size: 20.0,
              ),
            ),
          ),
        ]),
        InformationsFound(
          data.mensagemDeAviso,
          60,
          Icon(
            Icons.warning,
            color: Colors.blue[800],
            size: 20.0,
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.network(data.endereco.imageUrl,
                    width: 300, height: 60, fit: BoxFit.cover),
                flex: 4,
              ),
              Expanded(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue[800],
                  size: 32.0,
                ),
                flex: 1,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
