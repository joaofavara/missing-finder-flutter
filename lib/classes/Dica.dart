import './Endereco.dart';
import './User.dart';

class Dica {
  String dataAtualizacao;
  String dataCriacao;
  Endereco endereco;
  int id;
  String lat;
  String long;
  String mensagemDeAviso;
  User user;

  Dica(
      {this.dataAtualizacao,
      this.dataCriacao,
      this.endereco,
      this.id,
      this.lat,
      this.long,
      this.mensagemDeAviso,
      this.user});

  Dica.fromJson(Map<String, dynamic> json) {
    dataAtualizacao = json['data_atualizacao'];
    dataCriacao = json['data_criacao'];
    endereco = json['endereco'] != null
        ? new Endereco.fromJson(json['endereco'])
        : null;
    id = json['id'];
    lat = json['lat'];
    long = json['long'];
    mensagemDeAviso = json['mensagem_de_aviso'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_atualizacao'] = this.dataAtualizacao;
    data['data_criacao'] = this.dataCriacao;
    if (this.endereco != null) {
      data['endereco'] = this.endereco.toJson();
    }
    data['id'] = this.id;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['mensagem_de_aviso'] = this.mensagemDeAviso;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}