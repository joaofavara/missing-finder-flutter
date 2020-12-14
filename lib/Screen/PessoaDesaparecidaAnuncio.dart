import 'dart:convert';
import 'package:app/components/ImagemAnuncio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../classes/MissedPeople.dart';
import '../components/Informacoes.dart';

// ignore: must_be_immutable
class PessoaDesaparecida extends StatelessWidget {
  MissedPeople missedPeople;

  Future<MissedPeople> getPerson(int id) async {
    var response = await http.get('http://10.0.2.2:5000/api/people/missed/$id');
    Map parsed = await jsonDecode(response.body);
    missedPeople = MissedPeople.fromJson(parsed);
    return missedPeople;
  }

  @override
  Widget build(BuildContext context) {
  final anuncioId = (ModalRoute.of(context).settings.arguments);

    return Scaffold(
      appBar: AppBar(
        title: Text("Missing Finder",),
        centerTitle: true,
      ),
      body: FutureBuilder<MissedPeople>(
            future: getPerson(anuncioId), // Fetch the data
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                MissedPeople data = snapshot.data;
                return Container (
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Expanded (
                            child: ImagemAnuncio(
                        data.urlImagem,
                        data.nome,
                        data.idade
                      ),
                          ),
                        ]
                      ), 
                      Row (
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Informacoes('${data.nome}\n${data.parentesco}', 60.0,  Icon(
                            Icons.account_circle,
                            color: Colors.blue[800],
                            size: 20.0,
                          ),),
                          Informacoes('${data.user.telefone}\nCelular', 60.0,  Icon(
                            Icons.phone,
                            color: Colors.blue[800],
                            size: 20.0,
                          ),)
                        ]
                      ),
                      Row (
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Informacoes('${data.user.email}', 60.0,  Icon(
                            Icons.email,
                            color: Colors.blue[800],
                            size: 20.0,
                          ),),
                          Informacoes('21/03/2020', 60.0,  Icon(
                            Icons.calendar_today,
                            color: Colors.blue[800],
                            size: 20.0,
                          ),)
                        ]
                      ),
                      Informacoes('${data.mensagemDeAviso}', 60.0,  Icon(
                        Icons.warning,
                        color: Colors.blue[800],
                        size: 20.0,
                      ),),
                      Informacoes('${data.mensagemParaDesaparecido}', 60.0,  Icon(
                        Icons.message,
                        color: Colors.blue[800],
                        size: 20.0,
                      ),),
                      Card (
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Image.network(
                              data.endereco.imageUrl, 
                              width: 350,
                              height: 80,
                              fit: BoxFit.cover
                            ),
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
