import 'package:flutter/material.dart';
//import 'package:missing_finder/Screen/Profile.dart';
//import 'package:missing_finder/routes/app_routes.dart';



class HomePage extends StatelessWidget {
 
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Missing Finder",
        ),
        centerTitle: true,
      ),
      
      body: GridView.count(
        crossAxisCount: 2, //Grid com 2 colunas
        children: List.generate(100, (index) {
          return Center(
            child: Image.asset(
              'assets/imagens/katyperry_similaridades.jpg',
            ),
            //title: Text('Katheryn, 25 - San Francisco, CA'),
          );
        }),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => goToInstrucoesFoto(context),
              icon: Icon(Icons.add_circle_sharp, color: Colors.white),
            ),
            IconButton(
              onPressed: () => goToProfile(context),
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
