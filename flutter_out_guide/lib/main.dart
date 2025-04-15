import 'package:flutter/material.dart';   // importando bibliotecas 'material.dart' e 'provider.dart'
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';

import 'src/pages/home.dart';   // importando 'página' home

void main() => runApp(    // função inicial
  MultiProvider(
    providers: [    // array de 'providers'
      ChangeNotifierProvider(
        create: (context) => AppData()    // 'AppData' é o provider que será executado
      )
    ],
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {   // criação do app padrão
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {   // objeto 'routes' aloca as rotas disponiveis
        '/home': (context) => HomePage()
      },
      initialRoute: '/home',
    );
  }
}