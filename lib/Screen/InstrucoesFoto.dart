import 'package:flutter/material.dart';

class InstrucoesFoto extends StatelessWidget {
   Future<void> goToHome(BuildContext context) async {
    Navigator.of(context).popAndPushNamed(
      '/home',
    );
  }

  Future<void> goToTirarFoto(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/tirar_foto',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Missing Finder'),
      ),
      backgroundColor: Colors.grey,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () => goToHome(context),
              icon: Icon(
                Icons.home,
                color: Colors.white, size: 30                
              ),
            ),
            IconButton(
              onPressed: () => goToTirarFoto(context),
              icon: Icon(Icons.arrow_forward_sharp, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'Sugestões:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            // segunda linha
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 0,
              ),
              child: Text(
                '1. Enquadre toda a face, cortando a foto um pouco acima do peito',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),

            // terceira linha
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 0,
              ),
              child: Text(
                '2. Certifique-se que a pessoa está com os olhos abertos.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),

            // quarta linha
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 0,
              ),
              child: Text(
                '3. Evite mexer a câmera bruscamente para evitar borrões.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  'Exemplo:',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Image.asset(
              'assets/imagens/Obama.jpg',
              width: 200,
              height: 270,
            ),
          ],
        ),
      ),
    );
  }
}
