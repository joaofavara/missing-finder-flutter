import 'package:flutter/material.dart';
import 'package:missing_finder/Screen/AdicionarAnuncio.dart';
import 'package:missing_finder/Screen/ChecaAnuncio.dart';
import 'package:missing_finder/Screen/ChecaAnuncioAchada.dart';
import 'package:missing_finder/Screen/InstrucoesFoto.dart';
import 'package:missing_finder/Screen/Profile.dart';
import 'package:missing_finder/Screen/Similaridades.dart';
import 'package:missing_finder/Screen/TirarFoto.dart';
import 'Screen/Home.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    routes: {
      AppRoutes.HOME: (context) => HomePage(),
      AppRoutes.ADICIONAR_ANUNCIO: (context) => AdicionarAnuncio(),
      AppRoutes.PROFILE: (context) => Profile(),
      AppRoutes.INSTRUCOES_FOTO: (context) => InstrucoesFoto(),
      AppRoutes.TIRAR_FOTO: (context) => TirarFoto(),
      AppRoutes.SIMILARIDADES: (context) => Similaridades(),
      AppRoutes.CHECA_ANUNCIO: (context) => ChecaAnuncio(),
      AppRoutes.CHECA_ANUNCIO_ACHADA: (context) => ChecaAnuncioAchada(),
    },
  ));
}
