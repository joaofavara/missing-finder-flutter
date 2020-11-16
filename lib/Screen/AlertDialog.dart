import 'package:flutter/material.dart';

showAlertDialog1(BuildContext context) {
  Widget confirmButton = FlatButton(
      //child: Text("Confirmar"),
      child: Icon(Icons.check_circle, color: Colors.green, size: 60),
      onPressed: () {
        Navigator.of(context).pop();
        showAlertDialog2(context);
      });
  Widget cancelButton = FlatButton(
    //child: Text("Cancelar"),
    child: Icon(Icons.cancel, color: Colors.red, size: 60),
    onPressed: () => Navigator.pop(context),
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Tem certeza de que é essa pessoa?"),
    //content: Text("Tem certeza de que é essa pessoa?"),
    actions: [
      confirmButton,
      cancelButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog2(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () => Navigator.pop(context),
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("OBRIGADO!"),
    content: Text("Sua ajuda é muito importante para nós!"),

    actions: [
      okButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
