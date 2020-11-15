import 'package:flutter/material.dart';

// TELA PARA CHECAR ANUNCIO DAS PESSOAS PERDIDAS
class ChecaAnuncio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Missing Finder",
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(2.0),
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.grey[200],
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(children: <Widget>[
                  Image.network(
                      "https://uploaddeimagens.com.br/images/002/944/226/full/KatyPerry.jpg",
                      
                      height: 300,
                      fit: BoxFit.fitWidth),
                  Text(
                    "Katherine Hudson",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "34 anos",
                    style: TextStyle(fontSize: 22),
                  ),
                ]),
              ),
            ),
            Card(
              color: Colors.blue[200],
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.person, color: Colors.blue),
                        Text(
                          "Angela Hudson",
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          "Mãe",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.phone, color: Colors.blue),
                        Text(
                          "Contato:",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "+55 19 99999-9999",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.blue[200],
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.mail, color: Colors.blue),
                        Text(
                          "Email:",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "anghudson@mail.com",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.blue),
                        Text(
                          "Desaparecido desde:",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "29/Maio/2020",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.blue[200],
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.info, color: Colors.blue),
                      Text(
                        "Minha filha desapareceu. Ela tem algumas tatuagens no corpo...",
                        style: TextStyle(fontSize: 20),
                      ),
                    ]),
              ),
            ),
            Card(
              color: Colors.blue[200],
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.format_quote_outlined, color: Colors.blue),
                      Text(
                        "Katherine, volte para casa! Estamos preocupados!",
                        style: TextStyle(fontSize: 20),
                      ),
                    ]),
              ),
            ),
            Card(
              color: Colors.blue[200],
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "MAPA",
                        style: TextStyle(fontSize: 20),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
