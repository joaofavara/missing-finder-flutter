import 'package:flutter/material.dart';

import 'SignUp.dart';
import 'authService.dart';
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

  void login(String email, String password, BuildContext context) {
    setState(() {
      loginAuthService(email, password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    });
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
                  login(emailController.text, passwordController.text, context);
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
