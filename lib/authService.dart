import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

loginAuthService(String username, String password) async {
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

  Response r = await get('http://127.0.0.1:5000/api/authentication',
      headers: <String, String>{'authorization': basicAuth});
  print(r.statusCode);
  print(r.body);
}

Future<Response> signUpAuthService(User user) async {
  return post('http://127.0.0.1:5000/api/users',
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(user));
}

class User {
  String userName;
  String email;
  String senha;
  String telefone;
  String fullName;

  User(this.userName, this.email, this.senha, this.telefone, this.fullName);
}
