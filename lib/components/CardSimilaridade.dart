import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class CardSimilaridade extends StatelessWidget {
  CardSimilaridade(
      this.similaridade); /* Esse é o creator que vai receber os dados */
  var similaridade;

  Future<void> goToAddAnuncio(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/add_anuncio',
    );
  }

  Future<void> goToAnuncioPessoaDesaparecida(
      BuildContext context, int anuncioId) async {
    Navigator.of(context)
        .pushNamed('/anuncio_pessoa_desaparecida', arguments: anuncioId);
  }

  Future<void> goToAnuncioPessoaAchada(
      BuildContext context, int anuncioId) async {
    Navigator.of(context)
        .pushNamed('/anuncio_pessoa_achada', arguments: anuncioId);
  }

  String getImage(String argumentos) {
    return 'https://missing-finder-bucket.s3-sa-east-1.amazonaws.com/$argumentos';
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).popUntil((r) => r.isFirst);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Notificação"),
      content: Text("Enviamos uma mensagem para o responsável pelo anúncio."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showConfirmationDialog(
      BuildContext context, int anuncioId, String nome, String tipo) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "NÃO",
        style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.normal),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget continueButton = FlatButton(
        child: Text(
          "SIM",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          const url = 'http://10.0.2.2:5000/api/notifications/detected-person';
          var body = {"posterId": anuncioId, "type": tipo, "userId": 1};
          print(json.encode(body));
          var response = await http.post(url, body: json.encode(body));

          print(response);

          showAlertDialog(context);
        });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmação"),
      content: RichText(
        text: new TextSpan(
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(text: "Está certo de que"),
            new TextSpan(
                text: " $nome ",
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new TextSpan(text: "é a pessoa que você encontrou?"),
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('similaridade: $similaridade');
    print(similaridade.image);
    return Container(
      height: 200,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 2.0, color: Colors.blue),
            ),
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () => similaridade.type == 'DESAPARECIDA'
                      ? goToAnuncioPessoaDesaparecida(context, similaridade.id)
                      : goToAnuncioPessoaAchada(context, similaridade.id),
                  child: Stack(children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                new NetworkImage(getImage(similaridade.image))),
                      ),
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Container(),
                          flex: 4,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.black.withAlpha(180),
                            child: Text(
                              '${similaridade.name}, ${similaridade.age}',
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                color: Colors.white.withAlpha(200),
                              ),
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ]),
                ),
                flex: 3,
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Text(
                              'SIMILARIDADE:',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          Row(
                            children: [
                              Text(
                                '${similaridade.similarity}%',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ])),
                flex: 2,
              ),
              Expanded(
                child: InkWell(
                  onTap: () => showConfirmationDialog(context, similaridade.id,
                      similaridade.name, similaridade.type),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 48,
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
