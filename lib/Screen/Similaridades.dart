import 'dart:convert';
import 'dart:io';
import 'package:app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../components/CardSimilaridade.dart';
import '../classes/Similaridade.dart';

// ignore: must_be_immutable
class Similaridades extends StatelessWidget {
  Similaridade listaSimilaridade;

  Future<void> goToAddAnuncio(BuildContext context) async {
    Navigator.of(context).pushNamed(
      AppRoutes.TIPO_CADASTRO
    );
  }

  Future<Similaridade> getSimilarityList(File file) async {
      var stream = new http.ByteStream(Stream.castFrom(file.openRead()));
      var length = await file.length();

      var uploadURL = 'http://10.0.2.2:5000/api/face-recognition';
      var uri = Uri.parse(uploadURL);

      var request = new http.MultipartRequest("POST", uri);
      var multipartFile = new http.MultipartFile('file', stream, length, filename: basename(file.path));

      request.files.add(multipartFile);
      request.fields.addAll({'id': '123' });

      var response = await request.send();
      // var batata = response.stream.transform(utf8.decoder);
      var responseString = await response.stream.bytesToString();
      
      var data = await json.decode(responseString);
      listaSimilaridade = Similaridade.fromJson(data);

      return listaSimilaridade;
  }

  @override
  Widget build(BuildContext context) {
    final file = ModalRoute.of(context).settings.arguments;
    print(file.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Missing Finder'),
      ),

      // Bottom Bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text(
                'Não encontrou?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => goToAddAnuncio(context),
            ),
          ],
        ),
      ),

      body: FutureBuilder(
          future: getSimilarityList(file), // Fetch the data
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // If your List got fetched, them show each DataNews using a ListView
              Similaridade newsList = snapshot.data;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: newsList.result[0].recommendations.length,
                itemBuilder: (_, int index) {
                  return CardSimilaridade(newsList.result[0].recommendations[index]);
                },
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