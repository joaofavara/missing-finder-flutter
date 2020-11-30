class Endereco {
  String imageUrl;
  String rua;
  String numero;
  String bairro;
  String cidade;
  String estado;
  String cep;

  Endereco({this.imageUrl, this.rua, this.numero, this.bairro, this.cidade, this.estado, this.cep});

  Endereco.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    rua = json['rua'];
    numero = json['numero'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
    cep = json['cep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['rua'] = this.rua;
    data['numero'] = this.numero;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['cep'] = this.cep;
    return data;
  }
}