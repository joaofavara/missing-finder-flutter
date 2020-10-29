import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen/formularioPessoaDesaparecida.dart';
import 'screen/formularioPessoaAchada.dart';
import 'screen/selecaoDoTipo.dart';
import 'routes/app_routes.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:app/screen/mapScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      routes: {
        AppRoutes.TIPO_CADASTRO: (ctx) => SelecaoDoTipo() ,
        AppRoutes.DESAPARECIDA: (ctx) => FormularioComponentPessoaDesaparecida(),
        AppRoutes.ACHADA: (ctx) => FormularioComponentPessoaAchada(),
        AppRoutes.MAPA: (ctx) => MapScreen(),
      },
    );
  }
}
