import './Endereco.dart';

class FoundPeople {
  bool ativo;
  List<double> encoding;
  int id;
  int idade;
  String nome;
  List<Tip> tip;
  String tipo;
  String urlImagem;

  FoundPeople(
      {this.ativo,
      this.encoding,
      this.id,
      this.idade,
      this.nome,
      this.tip,
      this.tipo,
      this.urlImagem});

  FoundPeople.fromJson(Map<String, dynamic> json) {
    ativo = json['ativo'];
    encoding = json['encoding'].cast<double>();
    id = json['id'];
    idade = json['idade'];
    nome = json['nome'];
    if (json['tip'] != null) {
      tip = new List<Tip>();
      json['tip'].forEach((v) {
        tip.add(new Tip.fromJson(v));
      });
    }
    tipo = json['tipo'];
    urlImagem = json['url_imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ativo'] = this.ativo;
    data['encoding'] = this.encoding;
    data['id'] = this.id;
    data['idade'] = this.idade;
    data['nome'] = this.nome;
    if (this.tip != null) {
      data['tip'] = this.tip.map((v) => v.toJson()).toList();
    }
    data['tipo'] = this.tipo;
    data['url_imagem'] = this.urlImagem;
    return data;
  }
}

class Tip {
  String descricao;
  Endereco endereco;
  int usuarioId;

  Tip({this.descricao, this.endereco, this.usuarioId});

  Tip.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    endereco = json['endereco'] != null
        ? new Endereco.fromJson(json['endereco'])
        : null;
    usuarioId = json['usuario_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    if (this.endereco != null) {
      data['endereco'] = this.endereco.toJson();
    }
    data['usuario_id'] = this.usuarioId;
    return data;
  }
}
