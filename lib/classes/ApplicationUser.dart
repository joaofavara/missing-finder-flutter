
class ApplicationUser {
  int id;
  String userName;
  String email;
  String senha;
  String telefone;
  String fullName;

  ApplicationUser(this.userName, this.email, this.senha, this.telefone, this.fullName);

  ApplicationUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    userName = json['nome'];
    senha = json['senha'];
    telefone = json['telefone'];
    fullName = json['nome_completo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['nome'] = this.userName;
    data['senha'] = this.senha;
    data['telefone'] = this.telefone;
    data['nome_completo'] = this.fullName;
    return data;
  }
}
