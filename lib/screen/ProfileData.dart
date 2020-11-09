import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:missing_find_app/classes/ApplicationUser.dart';

// ignore: must_be_immutable
class ProfileData extends StatelessWidget {
  ApplicationUser user;

  Future<ApplicationUser> getPerson(int id) async {
    var response = await http.get('http://localhost:5000/api/users/$id');
    Map parsed = await jsonDecode(response.body);
    user = ApplicationUser.fromJson(parsed);
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
                      "E-mail",
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.email,
                      style: TextStyle(fontSize: 13.0),
                    ),
                    Text(
                      "Telefone",
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.telefone,
                      style: TextStyle(fontSize: 13.0),
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
