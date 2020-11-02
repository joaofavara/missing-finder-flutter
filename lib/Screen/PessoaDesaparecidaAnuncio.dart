import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../classes/MissedPeople.dart';

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
                return Column(
                  children: [
                    Image.network(
                      data.urlImagem, 
                      width: 500,
                      height: 350,
                      fit: BoxFit.cover
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'Nome: ${data.nome}',
                            style: TextStyle(backgroundColor: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ]
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
