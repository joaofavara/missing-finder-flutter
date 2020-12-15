import 'dart:async';
import 'dart:convert';
import '../providers/imagem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';



/// This Widget is the main application widget.
class _FormularioComponentPessoaAchada extends State<FormularioComponentPessoaAchada> {
  final String googleMapsKey = FlutterConfig.get('GOOGLE_MAPS');
  final _formKey = GlobalKey<FormState>();
  final bool validate = false;

  // DateTime dataDeAniversario = DateTime.now();
  String nome = '';
  String idade = '';
  String nomeCompleto = '';
  String mensagemDeAviso = '';
  String _previewImageUrl;
  String longitude;
  String latitude;

    Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Anúncio criado com sucesso!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Poderá ver seu anúncios dentro do seu perfil.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).popUntil((r) => r.isFirst);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    var _latitude = locData.latitude.toString();
    var _longitude = locData.longitude.toString();

    final staticMapImageUrl = 'https://maps.googleapis.com/maps/api/staticmap?center=$_latitude,$_longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$_latitude,$_longitude&key=$googleMapsKey';

    setState(() {
      _previewImageUrl = staticMapImageUrl;
      latitude =  _latitude;
      longitude = _longitude;
    });
  }

  Future<void> _selectOnMap() async {
    dynamic selectedLocation = await Navigator.of(context).pushNamed('/mapa');

    var _latitude = selectedLocation.latitude.toString();
    var _longitude = selectedLocation.longitude.toString();

    final staticMapImageUrl = 'https://maps.googleapis.com/maps/api/staticmap?center=$_latitude,$_longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$_latitude,$_longitude&key=$googleMapsKey';

    setState(() {
      _previewImageUrl = staticMapImageUrl;
      latitude = _latitude;
      longitude = _longitude;
    });
  }

  // Future<void> _dataDeAniversario(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //         context: context,
  //         initialDate: dataDeAniversario,
  //         firstDate: DateTime(1900, 1),
  //         lastDate: DateTime(2101)
  //       );
  //       if (picked != null && picked != dataDeAniversario)
  //         setState(() {
  //                 dataDeAniversario = picked;
  //         });
  //  }

  @override
  Widget build(BuildContext context) {
    var imagem = Provider.of<ImageToForm>(context, listen:false).imageToForm;
    return Scaffold(
      appBar: AppBar(title: Text('Formulario')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nome',
                  ),
                  onSaved: (String val) {
                    nome = val;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Este campo deve ser preenchido';
                    }
                    nome = value;
                    return null;
                  }
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Idade',
                  ),
                  onSaved: (String val) {
                    idade = val;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Este campo deve ser preenchido';
                    }
                    idade = value;
                    return null;
                  }
                ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     hintText: 'Nome Completo',
                //   ),
                //   validator: (value) {
                //     if (value.isEmpty) {
                //       return 'Please enter some text';
                //     }
                //     nomeCompleto = value;
                //     return null;
                //   }
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 20.0),
                //       child: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: <Widget>[
                //           Text("${dataDeAniversario.toLocal()}".split(' ')[0]),
                //           SizedBox(height: 20.0,),
                //           RaisedButton(
                //             onPressed: () => _dataDeAniversario(context),
                //             child: Text('Data de Aniversario'),
                //           ),
                //         ],
                //       )
                //     ),
                //     Container(
                //       width: 100,
                //       child: TextFormField(
                //         decoration: const InputDecoration(
                //           hintText: 'Idade',
                //         ),
                //         onSaved: (String val) {
                //           idade = val;
                //         },
                //         validator: (value) {
                //           if (value.isEmpty) {
                //             return 'Please enter some text';
                //           }
                //           idade = value;
                //           return null;
                //         }
                //       ),
                //     )
                //   ]
                // ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Descrição',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Este campo deve ser preenchido';
                    }
                    mensagemDeAviso = value;
                    return null;
                  }
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 10, width: 100),
                    Container(
                      child: _previewImageUrl == null ? Text('Localização não informada') : 
                      Image.network(
                        _previewImageUrl,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FlatButton.icon(
                            onPressed: _getCurrentUserLocation,
                            icon: Icon(Icons.location_on),
                            label: Expanded(
                              child: Text(
                                'Localização atual',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            textColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        Expanded(
                          child: FlatButton.icon(
                            onPressed: _selectOnMap,
                            icon: Icon(Icons.map),
                            label: Expanded(
                              child: Text(
                                'Selecione no mapa',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            textColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RaisedButton(
                    onPressed: () async {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        const url = 'http://10.0.2.2:5000/api/people/found';
                        var body = {
                              "nome": nome,
                              "idade": int.parse(idade),
                              "input_path": imagem,
                              "dica": {
                                "usuario_id": 1,
                                "mensagem_de_aviso": mensagemDeAviso,
                                "lat": latitude,
                                "long": longitude,
                                "endereco": {
                                    "imageUrl": _previewImageUrl,
                                },
                              }
                          };
                        var response = await http.post(
                          url,
                          body: json.encode(body)
                        );

                        if(response.statusCode == 200) {
                          _showMyDialog();
                        }
                      }
                    },
                    child: Text('Enviar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FormularioComponentPessoaAchada extends StatefulWidget {

  @override
  _FormularioComponentPessoaAchada createState() => _FormularioComponentPessoaAchada();
}
