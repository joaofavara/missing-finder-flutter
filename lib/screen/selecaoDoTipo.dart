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
            FlatButton(
              child: Text('Uma pessoas esta desaparecida!'),
              color: Colors.blue,
              onPressed: () => goToFormDesaparecida(context),
            ),
            FlatButton(
              child: Text('Encontrei uma pessoa!'),
              color: Colors.blue,
              onPressed: () => goToFormAchada(context),
            ),
          ],
        ),
      ),
    );
  }
}