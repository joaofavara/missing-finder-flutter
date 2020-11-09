import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:missing_find_app/classes/ApplicationUser.dart';

// ignore: must_be_immutable
class MyInformations extends StatelessWidget {
  final changePasswordController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final changePasswordController2 = TextEditingController();
  ApplicationUser user;

  Future<ApplicationUser> getPerson(int id) async {
    var response = await http.get('http://localhost:5000/api/users/$id');
    Map parsed = await jsonDecode(response.body);
    user = ApplicationUser.fromJson(parsed);
    return user;
  }

  Future<int> changePassword(int id) async {
    //todo test old password
    var newPassword = changePasswordController.text;
    var response = await http.patch('http://localhost:5000/api/users/$id/$newPassword');

    return response.statusCode;
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
      body: FutureBuilder<ApplicationUser>(
          future: getPerson(userId), // Fetch the data
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              ApplicationUser data = snapshot.data;
              return Center(
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
                          data.userName,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "Minhas Informações",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.fullName,
                      style: TextStyle(
                          fontSize: 12.0, decoration: TextDecoration.underline),
                    ),
                    Text(
                      data.email,
                      style: TextStyle(
                          fontSize: 12.0, decoration: TextDecoration.underline),
                    ),
                    Text(
                      data.telefone.toString(),
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
                                    decoration: new InputDecoration(
                                        hintText: "Senha atual"),
                                    controller: oldPasswordController,
                                  ),
                                  new TextField(
                                    decoration: new InputDecoration(
                                        hintText: "Nova senha"),
                                    controller: changePasswordController,
                                  ),
                                  new TextField(
                                    decoration: new InputDecoration(
                                        hintText: "Confirme nova senha"),
                                    controller: changePasswordController2,
                                  ),
                                  new FlatButton(
                                    child: new Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      changePassword(userId);
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
              );
            } else {
              // If you have no data, show a progress indicator
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
