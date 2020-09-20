import 'dart:async';
import 'package:flutter/material.dart';


/// This Widget is the main application widget.
class Formulario extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Formulario')),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              // key: _key,
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
  DateTime selectedDate = DateTime.now();
  int _value = 1;
  String nome = '';

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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    nome = value;
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
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
                  items: [
                    DropdownMenuItem(
                      child: Text("First Item"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Second Item"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Third Item"),
                      value: 3
                    ),
                    DropdownMenuItem(
                        child: Text("Fourth Item"),
                        value: 4
                    )
                  ],
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
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RaisedButton(
                    onPressed: () {
                      print("Nome $nome");
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      // if (_formKey.currentState.validate()) {
                      //   print("Nome $nome");
                      // }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          );
        }
}
