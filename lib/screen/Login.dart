import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'Profile.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void loginAuthService(String username, String password) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    Response r = await get('http://10.0.2.2:5000/api/authentication',
        headers: <String, String>{'authorization': basicAuth});
    print(r.statusCode);
    print(r.body);

    if(r.statusCode == HttpStatus.accepted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Text(
              'Login',
              style: Theme.of(context).textTheme.headline4,
            ),
            Divider(),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Digite um email';
                }
                return null;
              },
            ),
            Divider(),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Digite uma senha';
                }
                return null;
              },
            ),
            Divider(),
            Expanded(
              flex: 0,
              child: FlatButton(
                onPressed: () {
                  loginAuthService(emailController.text, passwordController.text);
                },
                child: Text("Login"),
                color: Colors.blue,
                padding: EdgeInsets.all(10),
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
              ),
            ),
            new GestureDetector(
              onTap: () {
                if(_formKey.currentState.validate()){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp(title: widget.title)),
                  );
                }
              },
              child: new Text("Cadastrar", textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}
