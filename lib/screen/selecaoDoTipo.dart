import 'package:flutter/material.dart';

class SelecaoDoTipo extends StatelessWidget {
  Future<void> goToFormDesaparecida(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/desaparecida',
    );
  }

    Future<void> goToFormAchada(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/achada',
    );
  }

  @override
  Widget build( BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Missing Finder'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FlatButton(
                      child: Text(
                        'Uma pessoa está desaparecida.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () => goToFormDesaparecida(context),
                      height: 50.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FlatButton(
                      child: Text(
                        'Encontrei uma pessoa!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () => goToFormAchada(context),
                      height: 50.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}