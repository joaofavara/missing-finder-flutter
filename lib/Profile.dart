import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:missing_find_app/Cartazes.dart';
import 'package:missing_find_app/MyInformations.dart';
import 'package:missing_find_app/ProfileData.dart';
import 'package:missing_find_app/classes/User.dart';

class Profile extends StatelessWidget {
  User user;

  Future<User> getPerson(int id) async {
    var response = await http.get('http://127.0.0.1:5000/api/users/$id');
    Map parsed = await jsonDecode(response.body);
    user = User.fromJson(parsed);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    final userId = 212;

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
      body: FutureBuilder<User>(
          future: getPerson(userId), // Fetch the data
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              User data = snapshot.data;
              return Center(
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(data.nome),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileData()),
                          );
                        },
                        child: Text("Perfil"),
                        color: Colors.white,
                        textColor: Colors.blue,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Notificacoes"),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cartazes()),
                          );
                        },
                        child: Text("Meus cartazes"),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyInformations()),
                          );
                        },
                        child: Text("Minhas informações"),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              // If you have no data, show a progress indicator
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
