import 'package:flutter/material.dart';
//import 'package:missing_finder/Screen/Profile.dart';
//import 'package:missing_finder/routes/app_routes.dart';

class HomePage extends StatelessWidget {
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

    Future<void> goToChecaAnuncio(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/checa_anuncio',
    );
  }

    Future<void> goToChecaAnuncioAchada(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/checa_anuncio_achada',
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
      body: GridView.count(
        crossAxisCount: 2, //Grid com 2 colunas
        children: List.generate(10, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
          //return Center(
            child: new InkResponse(
              child: (
                Image.asset('assets/imagens/katyperry_similaridades.jpg', 
                width: 500, height: 500,fit: BoxFit.cover)
                //Image.network("https://robohash.org/$index")
              ),
              //onTap: () => goToChecaAnuncio(context),
              onTap: () => goToChecaAnuncioAchada(context),
            ),
                        
            // LINK QUE VEM É SIMILAR A ISSO: 
            //child: Image.network('https://mantovanellos-bucket.s3-sa-east-1.amazonaws.com/found/$index'),
                       
          );
        }),
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
              icon: Icon(Icons.add_circle_sharp, color: Colors.white, size: 30),
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