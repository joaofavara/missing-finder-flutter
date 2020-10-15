import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:missing_finder/Screen/AbrirGaleria.dart';
import 'package:missing_finder/Screen/AdicionarAnuncio.dart';
import 'package:missing_finder/Screen/InstrucoesFoto.dart';
import 'package:missing_finder/Screen/Profile.dart';
import 'package:missing_finder/Screen/TirarFoto.dart';
import 'Screen/Home.dart';
import 'routes/app_routes.dart';
import 'screen/formularioPessoaDesaparecida.dart';
import 'screen/formularioPessoaAchada.dart';
import 'screen/selecaoDoTipo.dart';
import 'routes/app_routes.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:app/screen/mapScreen.dart';
import 'Login.dart';

// void main() => runApp(MyApp());

  
void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();

  runApp(MyApp());
  
  // TODO: AVALIAR
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    routes: {
      //AppRoutes.HOME: (context) => HomePage(),
      AppRoutes.ADICIONAR_ANUNCIO: (context) => AdicionarAnuncio(),
      AppRoutes.PROFILE: (context) => Profile(),
      AppRoutes.INSTRUCOES_FOTO: (context) => InstrucoesFoto(),
      AppRoutes.TIRAR_FOTO: (context) => TirarFoto(),
      //AppRoutes.ABRIR_GALERIA: (context) => AbrirGaleria(),      
    },
  ));
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
      home: Login(title: 'Missing finder'),
      routes: {
        AppRoutes.TIPO_CADASTRO: (ctx) => SelecaoDoTipo() ,
        AppRoutes.DESAPARECIDA: (ctx) => FormularioComponentPessoaDesaparecida(),
        AppRoutes.ACHADA: (ctx) => FormularioComponentPessoaAchada(),
        AppRoutes.MAPA: (ctx) => MapScreen(),
      },
    );
  }
}
