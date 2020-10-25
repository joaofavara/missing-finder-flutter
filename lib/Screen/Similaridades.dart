import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:path/path.dart';

class Similaridade {
  Map endereco;
  Map user;
  Ink id;
  Ink idade;
  String mensagemDeAviso;
  String mensagemParaDesaparecido;
  String nome;
  String parentesco;
  String tipo;
  String urlImagem;

  Similaridade(
      {
      this.endereco,
      this.user,
      this.id,
      this.idade,
      this.mensagemDeAviso,
      this.mensagemParaDesaparecido,
      this.parentesco,
      this.tipo,
      this.urlImagem,
      this.nome});

  factory Similaridade.fromJson(Map<String, dynamic> json) {
    print('Similaridade: ${json['recommendations'][1]['nome']}');
    return Similaridade(
      endereco: json["endereco"],
      user: json["user"],
      id: json["id"],
      idade: json["idade"],
      mensagemDeAviso: json["mensagemDeAviso"],
      mensagemParaDesaparecido: json["mensagemParaDesaparecido"],
      parentesco: json["parentesco"],
      tipo: json["tipo"],
      urlImagem: json["urlImagem"],
      nome: json["nome"]
    );
  }
}


class Similaridades extends StatelessWidget {
  Future<void> goToAddAnuncio(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/add_anuncio',
    );
  }

  // Future<List> getSimilarity(File file) async {
  //   print('${((file.toString()).split(': ')[1])}');
  //   var body = {
  //     "file": (file.toString()).split(': ')[1],
  //     "id": 123,
  //   };
  //   var url = 'http://10.0.2.2:5000/api/face-recognition';
  //   var response = await http.ByteStream(
  //     url,
  //     body: json.encode(body)
  //   );
  //   List  data = convert.jsonDecode(response.body);
  //   List items = data.toList();
  //   print(items);
  //   return items;
  // }

  // Future<List<Similaridade>> teste (File file) async {
  Future<List> teste (File file) async {
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
      var test = json.decode(responseString);
      // print("test['name']: ${test['name']['recommendations']}");
      print("test['name']");
      var rec = await test['name'] as List;
      List data = await rec[0]['recommendations'] as List;
      print('data: ${data[0]['nome']}');
      // var data = rec['recommendations'];

      // List<Similaridade> list = data.map<Similaridade>((json) => Similaridade.fromJson(json)).toList();

      // List items = test.toList();
    // print(items);
      // Map data =  (response.stream.transform(utf8.decoder)) as Map;
      // for (var user in data) {
      //   print('BATATATATATA2');
      //   print(user['nome']);
      // }
      // print('data:');
      // print(data[0]["name"]);
      // print(' List items = data.toList()');
      // List items = data[0].values.toList();
      // print(items);

      // print(response.statusCode);
      // var batata = [];
      // response.stream.transform(utf8.decoder).listen((value) {
      //   // print(value);
      //   batata.add(value);
      // });

      return data;
  }

  String getImage(String argumentos) {

    return 'https://missing-finder-bucket.s3-sa-east-1.amazonaws.com/${argumentos}';
  }

  @override
  Widget build(BuildContext context) {
    final file = ModalRoute.of(context).settings.arguments;
    print('BATATA');
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

      // BODY
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 200,
        width: double.maxFinite,
        child:  FutureBuilder(
          future: teste(file), // Fetch the data
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // If your List got fetched, them show each DataNews using a ListView
              List<dynamic> newsList = snapshot.data;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: newsList.length,
                itemBuilder: (_, int index) {
                  return InkWell(
                    // onTap: () => goToChecaAnuncio(context, newsList[index]),
                    child: (
                      Image.network(
                        getImage(newsList[index]['output']),
                        width: 500,
                        height: 500,
                        fit: BoxFit.cover
                      )
                    ),
                  );
                },
              );
            } else {
              // If you have no data, show a progress indicator
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        // child: Card(
        //   elevation: 5,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       border: Border(
        //         top: BorderSide(width: 2.0, color: Colors.blue),
        //       ),
        //       color: Colors.white,
        //     ),
        //     child: Padding(
        //       padding: EdgeInsets.all(7),
        //       child: Stack(children: <Widget>[
        //         Align(
        //           alignment: Alignment.centerRight,
        //           child: Stack(
        //             children: <Widget>[
        //               Padding(
        //                   padding: const EdgeInsets.only(left: 10, top: 5),
        //                   child: Column(
        //                     children: <Widget>[
                              // FutureBuilder(
                              //   future: teste(file), // Fetch the data
                              //   builder: (_, AsyncSnapshot snapshot) {
                              //     if (snapshot.hasData) {
                              //       // If your List got fetched, them show each DataNews using a ListView
                              //       List<dynamic> newsList = snapshot.data;
                              //       return ListView.builder(
                              //         scrollDirection: Axis.vertical,
                              //         shrinkWrap: true,
                              //         itemCount: newsList.length,
                              //         itemBuilder: (_, int index) {
                              //           return InkWell(
                              //             // onTap: () => goToChecaAnuncio(context, newsList[index]),
                              //             child: (
                              //               Image.network(
                              //                 getImage(newsList[index]['output']),
                              //                 width: 500,
                              //                 height: 500,
                              //                 fit: BoxFit.cover
                              //               )
                              //             ),
                              //           );
                              //         },
                              //       );
                              //     } else {
                              //       // If you have no data, show a progress indicator
                              //       return Center(
                              //         child: CircularProgressIndicator(),
                              //       );
                              //     }
                              //   },
        //                       ),
        //                       // Row(
        //                       //   children: <Widget>[
        //                       //     Text(
        //                       //       '90%',
        //                       //       style: TextStyle(
        //                       //           color: Colors.red,
        //                       //           fontSize: 25,
        //                       //           fontWeight: FontWeight.bold),
        //                       //     ),
        //                       //     Spacer(),
        //                       //     CircleAvatar(
        //                       //       backgroundImage: AssetImage(
        //                       //           'assets/imagens/katyperry_similaridades.jpg'),
        //                       //       radius: 75,
        //                       //       backgroundColor: Colors.transparent,
        //                       //     ),
        //                       //     //Image.asset('assets/imagens/katyperry_similaridades.jpg',
        //                       //     //width: 150, height: 150,fit: BoxFit.cover),
        //                       //     Spacer(),
        //                       //     Icon(
        //                       //       Icons.check,
        //                       //       color: Colors.green,
        //                       //       size: 50,
        //                       //     ),
        //                       //     SizedBox(
        //                       //       width: 20,
        //                       //       height: 150,
        //                       //     ),
        //                       //   ],
        //                       // ),
        //                       // Row()
        //                     ],
        //                   ))
        //             ],
        //           ),
        //         )
        //       ]),
        //     ),
        //   ),
        // ),
      ),
    )
    );
  }
}
