import './User.dart';
import './Endereco.dart';

class MissedPeople {
  bool ativo;
  String dataDesaparecimento;
  String dataNascimento;
  List<double> encoding;
  Endereco endereco;
  int id;
  int idade;
  String mensagemDeAviso;
  String mensagemParaDesaparecido;
  String nome;
  String parentesco;
  String tipo;
  String urlImagem;
  User user;

  MissedPeople(
      {this.ativo,
      this.dataDesaparecimento,
      this.dataNascimento,
      this.encoding,
      this.endereco,
      this.id,
      this.idade,
      this.mensagemDeAviso,
      this.mensagemParaDesaparecido,
      this.nome,
      this.parentesco,
      this.tipo,
      this.urlImagem,
      this.user});

  MissedPeople.fromJson(Map<String, dynamic> json) {
    ativo = json['ativo'];
    dataDesaparecimento = json['data_desaparecimento'];
    dataNascimento = json['data_nascimento'];
    encoding = json['encoding'].cast<double>();
    endereco = json['endereco'] != null
        ? new Endereco.fromJson(json['endereco'])
        : null;
    id = json['id'];
    idade = json['idade'];
    mensagemDeAviso = json['mensagem_de_aviso'];
    mensagemParaDesaparecido = json['mensagem_para_desaparecido'];
    nome = json['nome'];
    parentesco = json['parentesco'];
    tipo = json['tipo'];
    urlImagem = json['url_imagem'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ativo'] = this.ativo;
    data['data_desaparecimento'] = this.dataDesaparecimento;
    data['data_nascimento'] = this.dataNascimento;
    data['encoding'] = this.encoding;
    if (this.endereco != null) {
      data['endereco'] = this.endereco.toJson();
    }
    data['id'] = this.id;
    data['idade'] = this.idade;
    data['mensagem_de_aviso'] = this.mensagemDeAviso;
    data['mensagem_para_desaparecido'] = this.mensagemParaDesaparecido;
    data['nome'] = this.nome;
    data['parentesco'] = this.parentesco;
    data['tipo'] = this.tipo;
    data['url_imagem'] = this.urlImagem;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}


