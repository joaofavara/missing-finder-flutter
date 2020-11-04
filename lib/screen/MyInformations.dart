import 'package:flutter/material.dart';

class MyInformations extends StatelessWidget {
  final changePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Missing Finder"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.filter_list,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/Katy_Perry.jpg',
                  width: 100,
                  height: 100,
                ),
                Text(
                  "Nome",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "Minhas Informações",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Nome",
              style: TextStyle(
                  fontSize: 12.0, decoration: TextDecoration.underline),
            ),
            Text(
              "Email",
              style: TextStyle(
                  fontSize: 12.0, decoration: TextDecoration.underline),
            ),
            Text(
              "Telefone",
              style: TextStyle(
                  fontSize: 12.0, decoration: TextDecoration.underline),
            ),
            Divider(
              color: Colors.white,
            ),
            FlatButton(
              onPressed: () {
                showDialog(
                    child: new AlertDialog(
                      contentPadding: const EdgeInsets.all(16.0),
                      content: new Column(
                        children: <Widget>[
                          new TextField(
                            decoration:
                                new InputDecoration(hintText: "Senha atual"),
                            controller: changePasswordController,
                          ),
                          new TextField(
                            decoration:
                                new InputDecoration(hintText: "Nova senha"),
                            controller: changePasswordController,
                          ),
                          new TextField(
                            decoration: new InputDecoration(
                                hintText: "Confirme nova senha"),
                            controller: changePasswordController,
                          ),
                          new FlatButton(
                            child: new Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                    context: context);
              },
              child: Text("Alterar senha"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
