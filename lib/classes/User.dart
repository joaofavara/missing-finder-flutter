class User {
  String email;
  int id;
  String nome;
  String telefone;

  User({this.email, this.id, this.nome, this.telefone});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    nome = json['nome'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    return data;
  }
}