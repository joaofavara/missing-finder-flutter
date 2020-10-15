import 'package:flutter/material.dart';


class AbrirGaleria extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Missing Finder'),
      ),

      bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_sharp, color: Colors.white),
              ),
            ],
          ),
        ),

        body: Container(
          child: Text('ABRIR GALERIA'),
        ),

    );
  }
}
