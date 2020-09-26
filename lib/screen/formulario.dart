import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:location/location.dart';


/// This Widget is the main application widget.
class Formulario extends StatelessWidget {
  // final bool _validate = false;
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Formulario')),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              // key: _formKey,
              // autovalidate: _validate,
              child: FormularioComponent(),
            ),
          ),
        ),
      ),
    );
  }
}

class FormularioComponent extends StatefulWidget {

  @override
  _FormularioComponent createState() => _FormularioComponent();
}


/// This is the stateless widget that the main application instantiates.
class _FormularioComponent extends State<FormularioComponent> {
  final _formKey = GlobalKey<FormState>();
  final bool validate = false;

  DateTime dataDoDesaparecimento = DateTime.now();
  DateTime dataDeAniversario = DateTime.now();
  List parentescos = ['Pai', 'Avó', 'Mãe', 'Avô'];
  int parentesco = 0;
  String nome = '';
  String nomeCompleto = '';
  String descricao = '';
  String mensagem = '';
  String _previewImageUrl;
  var longitude = '';
  var latitude = '';

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    latitude = locData.latitude as String;
    longitude = locData.longitude as String;

    final staticMapImageUrl = 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$latitude,$longitude&key=?';

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _dataDoDesaparecimento(BuildContext context) async {
    final DateTime picked = await showDatePicker(
          context: context,
          initialDate: dataDoDesaparecimento,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101)
        );
        if (picked != null && picked != dataDoDesaparecimento)
          setState(() {
                  dataDoDesaparecimento = picked;
          });
  }

  Future<void> _dataDeAniversario(BuildContext context) async {
    final DateTime picked = await showDatePicker(
          context: context,
          initialDate: dataDeAniversario,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101)
        );
        if (picked != null && picked != dataDeAniversario)
          setState(() {
                  dataDeAniversario = picked;
          });
   }
      
        @override
        Widget build(BuildContext context) {
          return Form(
            key: _formKey,
            child: Column(
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
                      return 'Please enter some text';
                    }
                    nome = value;
                    return null;
                  }
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nome Completo',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    nomeCompleto = value;
                    return null;
                  }
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("${dataDeAniversario.toLocal()}".split(' ')[0]),
                      SizedBox(height: 20.0,),
                      RaisedButton(
                        onPressed: () => _dataDeAniversario(context),
                        child: Text('Data de Aniversario'),
                      ),
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("${dataDoDesaparecimento.toLocal()}".split(' ')[0]),
                      SizedBox(height: 20.0,),
                      RaisedButton(
                        onPressed: () => _dataDoDesaparecimento(context),
                        child: Text('Data do Desaparecimento'),
                      ),
                    ],
                  )
                ),
                DropdownButton(
                  value: parentesco,
                  items: parentescos.asMap().entries.map((parentesco) {
                      return DropdownMenuItem(
                        child: Text(parentesco.value),
                        value: (parentesco.key),
                      );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      parentesco = value;
                    });
                }),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Descrição',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    descricao = value;
                    return null;
                  }
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Mensagem para a pessoa desaparecida',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    mensagem = value;
                    return null;
                  }
                ),
                SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    Container(
                      child: _previewImageUrl == null ? Text('Localizacao nao informada') : 
                      Image.network(
                        _previewImageUrl,
                      ),
                    ),
                    Row(
                      children: [
                        FlatButton.icon(
                          onPressed: _getCurrentUserLocation,
                          icon: Icon(Icons.location_on),
                          label: Text('Localização Atual'),
                          textColor: Theme.of(context).primaryColor,
                        ),
                         FlatButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.map),
                          label: Text('Localização Atual'),
                          textColor: Theme.of(context).primaryColor,
                        )
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
                        const url = 'http://10.0.2.2:5000/api/people/missed';
                        var body = {
                              "nome": nome,
                              "nascimento": DateFormat('yyyy-MM-dd').format(dataDeAniversario),
                              "data_desaparecimento": DateFormat('yyyy-MM-dd').format(dataDoDesaparecimento),
                              "parentesco": parentescos[parentesco],
                              "mensagem_de_aviso": descricao,
                              "mensagem_para_desaparecido": mensagem,
                              "endereco": {
                                  "imageUrl": _previewImageUrl,
                                  "lat": latitude,
                                  "long": longitude
                              },
                              "usuario_id": 1
                          };
                        await http.post(
                          url,
                          body: json.encode(body)
                        );
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          );
        }
}
