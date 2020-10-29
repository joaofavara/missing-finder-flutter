class Endereco {
  String imageUrl;
  String lat;
  String long;

  Endereco({this.imageUrl, this.lat, this.long});

  Endereco.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}