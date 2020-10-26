import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
//import 'package:missing_finder/Screen/Profile.dart';
//import 'package:missing_finder/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  Future<List> getAllPersons() async {
    var response = await http.get('http://10.0.2.2:5000/api/people/missed');
    List  data = convert.jsonDecode(response.body);
    List items = data.toList();
    return items;
  }

   Future<void> goToHome(BuildContext context) async {
    Navigator.of(context).popAndPushNamed(
      '/home',
    );
  }

  Future<void> goToInstrucoesFoto(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/instrucoes_foto',
    );
  }

  Future<void> goToProfile(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/profile',
    );
  }

  Future<void> goToChecaAnuncio(BuildContext context, Map anuncio) async {
    Navigator.of(context).pushNamed(
      '/checa_anuncio',
      arguments: anuncio
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Missing Finder",
        ),
        centerTitle: true,
      ),

      body: FutureBuilder(
            future: getAllPersons(), // Fetch the data
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<dynamic> newsList = snapshot.data;

                return  GridView.count(
                  crossAxisCount: 2, //Grid com 2 colunas
                  children: List.generate(newsList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new InkResponse(
                        child: Stack(
                          children: <Widget> [
                            Image.network(
                              newsList[index]['url_imagem'], 
                              width: 500,
                              height: 500,
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
                                    '${newsList[index]['nome']}, ${newsList[index]['idade']}',
                                    style: TextStyle(backgroundColor: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ]
                        ),
                        onTap: () => goToChecaAnuncio(context, newsList[index]),
                      ),
                    );
                  }),
                );
                
              } else {
                // If you have no data, show a progress indicator
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
        ),

      // BOTTOM BAR
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {}, //=> goToHome(context),
              icon: Icon(Icons.home, color: Colors.white, size: 30),
            ),
            IconButton(
              onPressed: () => goToInstrucoesFoto(context),
              icon: Icon(Icons.add_circle, color: Colors.white, size: 30),
            ),
            IconButton(
              onPressed: () => goToProfile(context),
              icon: Icon(Icons.person, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}