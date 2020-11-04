import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
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
              "E-mail",
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "email",
              style: TextStyle(fontSize: 13.0),
            ),
            Text(
              "Telefone",
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Telefone",
              style: TextStyle(fontSize: 13.0),
            ),
          ],
        ),
      ),
    );
  }
}
