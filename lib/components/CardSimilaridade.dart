import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardSimilaridade extends StatelessWidget {
    CardSimilaridade(this.similaridade); /* Esse é o creator que vai receber os dados */
    var similaridade;

  Future<void> goToAddAnuncio(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/add_anuncio',
    );
  }

  Future<void> goToAnuncioPessoaDesaparecida(BuildContext context, int anuncioId) async {
    Navigator.of(context).pushNamed(
      '/anuncio_pessoa_desaparecida',
      arguments: anuncioId
    );
  }

  Future<void> goToAnuncioPessoaAchada(BuildContext context, int anuncioId) async {
    Navigator.of(context).pushNamed(
      '/anuncio_pessoa_achada',
      arguments: anuncioId
    );
  }

  String getImage(String argumentos) {
    return 'https://missing-finder-bucket.s3-sa-east-1.amazonaws.com/${argumentos}';
  }

  @override
  Widget build(BuildContext context) {
    print('similaridade: $similaridade');
    return InkWell(
      onTap: () => similaridade.type == 'DESAPARECIDA' ? goToAnuncioPessoaDesaparecida(context, similaridade.id) : goToAnuncioPessoaAchada(context, similaridade.id),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
            child: Padding(
              padding: EdgeInsets.all(7),
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Similaridade:\n${similaridade.similarity}%',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ),
                                  ),
                                  Spacer(),
                                  Stack (
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              getImage(similaridade.image)
                                            ),
                                            radius: 65,
                                            backgroundColor: Colors.transparent,
                                          ),
                                          Text(
                                            '${similaridade.name}, ${similaridade.age}',
                                            style: TextStyle(backgroundColor: Colors.grey),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 150,
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      )
    );
  }
}