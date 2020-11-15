import 'dart:convert';
import 'package:app/components/ImagemAnuncio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../classes/FoundPeople.dart';
import '../components/TipPeolpleFound.dart';

// ignore: must_be_immutable
class PessoaAchada extends StatelessWidget {
  FoundPeople foundPeople;

  Future<FoundPeople> getPerson(int id) async {
    var response = await http.get('http://10.0.2.2:5000/api/people/found/$id');
    Map parsed = await jsonDecode(response.body);
    foundPeople = FoundPeople.fromJson(parsed);
    return foundPeople;
  }

  @override
  Widget build(BuildContext context) {
  final anuncioId = (ModalRoute.of(context).settings.arguments);

    return Scaffold(
      appBar: AppBar(
        title: Text("Missing Finder",),
        centerTitle: true,
      ),
      body: FutureBuilder<FoundPeople>(
            future: getPerson(anuncioId), // Fetch the data
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                FoundPeople data = snapshot.data;
                 return Container (
                  child: Column(
                    children: <Widget>[
                      ImagemAnuncio(
                        data.urlImagem,
                        data.nome,
                        data.idade
                      ),
                      Container(
                        height: 300,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          // itemCount: data.dica.length,
                          itemBuilder: (_, int index) {
                            return TipPeolpleFound(data.dica);
                          },
                        ),
                      ),
                    ],
                  )
                );
              } else {
              // If you have no data, show a progress indicator
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
      )
    );
  }
}
