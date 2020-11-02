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

      // BODY
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 200,
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2.0, color: Colors.blue),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(7),
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    '90%',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/imagens/katyperry_similaridades.jpg'),
                                    radius: 75,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  //Image.asset('assets/imagens/katyperry_similaridades.jpg',
                                  //width: 150, height: 150,fit: BoxFit.cover),
                                  Spacer(),
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 50,
                                  ),
                                  //onPressed: () {},
                                  SizedBox(
                                    width: 20,
                                    height: 150,
                                  ),
                                ],
                              ),
                              Row()
                            ],
                          ))
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
