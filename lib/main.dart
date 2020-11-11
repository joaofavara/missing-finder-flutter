import 'package:flutter/material.dart';
import 'screen/PessoaAchadaAnuncio.dart';
import 'screen/PessoaDesaparecidaAnuncio.dart';
import 'screen/mapScreen.dart';
import 'screen/AdicionarAnuncio.dart';
import 'screen/Home.dart';
import 'screen/InstrucoesFoto.dart';
import 'screen/Profile.dart';
import 'screen/Similaridades.dart';
import 'screen/TirarFoto.dart';
import 'screen/formularioPessoaDesaparecida.dart';
import 'screen/formularioPessoaAchada.dart';
import 'screen/selecaoDoTipo.dart';
import 'routes/app_routes.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';
import './providers/imagem.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImageToForm(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (context) => HomePage(),
          AppRoutes.TIPO_CADASTRO: (ctx) => SelecaoDoTipo() ,
          AppRoutes.DESAPARECIDA: (ctx) => FormularioComponentPessoaDesaparecida(),
          AppRoutes.ACHADA: (ctx) => FormularioComponentPessoaAchada(),
          AppRoutes.MAPA: (ctx) => MapScreen(),
          AppRoutes.ADICIONAR_ANUNCIO: (context) => AdicionarAnuncio(),
          AppRoutes.PROFILE: (context) => Profile(),
          AppRoutes.INSTRUCOES_FOTO: (context) => InstrucoesFoto(),
          AppRoutes.TIRAR_FOTO: (context) => TirarFoto(),
          AppRoutes.SIMILARIDADES: (context) => Similaridades(),
          AppRoutes.ANUNCIO_PESSOA_DESAPARECIDA: (context) => PessoaDesaparecida(),
          AppRoutes.ANUNCIO_PESSOA_ACHADA: (context) => PessoaAchada(),
        },
      )
    );
  }
}
