import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../classes/FoundPeople.dart';
import '../components/Informacoes.dart';

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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.network(
                        data.urlImagem, 
                        width: 400,
                        height: 275,
                        fit: BoxFit.cover
                      ),
                      Row (
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Informacoes('Teste', 70.0,  Icon(
                            Icons.account_circle,
                            color: Colors.black,
                            size: 20.0,
                          ),),
                          Informacoes('Teste', 70.0,  Icon(
                            Icons.phone,
                            color: Colors.black,
                            size: 20.0,
                          ),)
                        ]
                      ),
                      Row (
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Informacoes('Teste', 70.0,  Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 20.0,
                          ),),
                          Informacoes('21/03/2020', 70.0,  Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                            size: 20.0,
                          ),)
                        ]
                      ),
                      Informacoes('Teste', 70.0,  Icon(
                        Icons.warning,
                        color: Colors.black,
                        size: 20.0,
                      ),),
                      Informacoes('Teste', 70.0,  Icon(
                        Icons.message,
                        color: Colors.black,
                        size: 20.0,
                      ),),
                      Card (
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image.network(
                            //   data.endereco.imageUrl, 
                            //   width: 350,
                            //   height: 125,
                            //   fit: BoxFit.cover
                            // ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 32.0,
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
