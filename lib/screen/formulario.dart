import 'dart:async';
import 'package:flutter/material.dart';


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

  
  
  DateTime selectedDate = DateTime.now();
  List parentescos = ['Pai', 'Avó', 'Mãe', 'Avô'];
  int _value = 0;
  final _formKey = GlobalKey<FormState>();
  final bool validate = false;
  String nome = '';
  String nomeCompleto = '';
  String descricao = '';
  String mensagem = '';


  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
              selectedDate = picked;
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
                    hintText: 'Enter your email',
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
                    hintText: 'Enter your email',
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
                      Text("${selectedDate.toLocal()}".split(' ')[0]),
                      SizedBox(height: 20.0,),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select date'),
                      ),

                      Text("${selectedDate.toLocal()}".split(' ')[0]),
                      SizedBox(height: 20.0,),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select date'),
                      ),
                    ],
                  )
                ),
                DropdownButton(
                  value: _value,
                  items: parentescos.asMap().entries.map((parentesco) {
                      return DropdownMenuItem(
                        child: Text(parentesco.value),
                        value: (parentesco.key),
                      );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                }),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
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
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    mensagem = value;
                    return null;
                  }
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RaisedButton(
                    onPressed: () {

                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        print("Nome $nome");
                        print("Completo $nomeCompleto");
                        print("Descrição $descricao");
                        print("Mensagem $mensagem");
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
