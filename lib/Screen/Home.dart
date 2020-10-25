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

      // BODY => GRID COM AS FOTOS
      // body: GridView.count(
      //   crossAxisCount: 2, //Grid com 2 colunas
      //   children: List.generate(10, (index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //     //return Center(
      //       child: new InkResponse(
      //         child: (
      //           Image.asset('assets/imagens/katyperry_similaridades.jpg', 
      //           width: 500, height: 500,fit: BoxFit.cover)
      //           //Image.network("https://robohash.org/$index")
      //         ),
      //         onTap: () => getAllPersons(),
      //       ),
                        
      //       // LINK QUE VEM É SIMILAR A ISSO: 
      //       //child: Image.network('https://mantovanellos-bucket.s3-sa-east-1.amazonaws.com/found/$index'),
                       
      //     );
      //   }),
      // ),
      body: FutureBuilder(
        future: getAllPersons(), // Fetch the data
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // If your List got fetched, them show each DataNews using a ListView
            List<dynamic> newsList = snapshot.data;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (_, int index) {
                return InkWell(
                  onTap: () => goToChecaAnuncio(context, newsList[index]),
                  child: (
                    Image.network(
                      newsList[index]['url_imagem'],
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