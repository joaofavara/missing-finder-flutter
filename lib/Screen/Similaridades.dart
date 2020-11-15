import 'package:flutter/material.dart';

class Similaridades extends StatelessWidget {
  Future<void> goToAddAnuncio(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/add_anuncio',
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(5),
        //padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        width: double.maxFinite,
        child: Column(children: <Widget>[
          Card(
            elevation: 5,            
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: Colors.blue),
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "SIMILARIDADE",
                        style: TextStyle(fontSize: 15, color: Colors.blue,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "90%",
                        style: TextStyle(fontSize: 50, color: Colors.blue,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
//                        backgroundImage: AssetImage(
//                          'assets/imagens/katyperry_similaridades.jpg'),
                          backgroundImage: NetworkImage( 
                            'https://uploaddeimagens.com.br/images/002/944/226/full/KatyPerry.jpg'),
                            radius: 75,
                            backgroundColor: Colors.transparent,
                      ),
                      Container(
                        child: Text(
                          'KATHERINE',
                          style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ), 
                    ],
                  ),
                  Spacer(),
                  Spacer(),
                  Column(
                    children: [
                      Icon(Icons.check, color: Colors.green, size: 60),
                      //onPressed: () {}
                    ],
                  ),
                  Spacer(),
                  
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
