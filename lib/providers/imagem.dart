import 'package:flutter/material.dart';

class ImageToForm with ChangeNotifier {
  String imageToForm = 'batata';

  String get () => imageToForm;

  void setupImageForm(String image) {
    imageToForm = image;
    notifyListeners();
  }
}