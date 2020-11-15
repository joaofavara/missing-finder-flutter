import 'Dica.dart';

class FoundPeople {
  bool ativo;
  String dataCriacao;
  Null dataDesativacao;
  Dica dica;
  List<double> encoding;
  int id;
  int idade;
  String nome;
  String tipo;
  String urlImagem;

  FoundPeople(
      {this.ativo,
      this.dataCriacao,
      this.dataDesativacao,
      this.dica,
      this.encoding,
      this.id,
      this.idade,
      this.nome,
      this.tipo,
      this.urlImagem});

  FoundPeople.fromJson(Map<String, dynamic> json) {
    ativo = json['ativo'];
    dataCriacao = json['data_criacao'];
    dataDesativacao = json['data_desativacao'];
    dica = json['dica'] != null ? new Dica.fromJson(json['dica']) : null;
    encoding = json['encoding'].cast<double>();
    id = json['id'];
    idade = json['idade'];
    nome = json['nome'];
    tipo = json['tipo'];
    urlImagem = json['url_imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ativo'] = this.ativo;
    data['data_criacao'] = this.dataCriacao;
    data['data_desativacao'] = this.dataDesativacao;
    if (this.dica != null) {
      data['dica'] = this.dica.toJson();
    }
    data['encoding'] = this.encoding;
    data['id'] = this.id;
    data['idade'] = this.idade;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['url_imagem'] = this.urlImagem;
    return data;
  }
}

class Endereco {
  String imageUrl;

  Endereco({this.imageUrl});

  Endereco.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
