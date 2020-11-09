
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
}
