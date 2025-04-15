import 'package:flutter/material.dart';
import 'package:flutter/services.dart';         // importando pacote 'services'

class PreloadPage extends StatefulWidget {
    @override
    _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
    bool loading = false;

    @override
    Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

        return Scaffold(
            body:Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Image.asset('lib/assets/mundo.jfif',
                            width: 200,
                        ),

                        loading ? Container(        // condiçional se 'loading' estiver 'true' esse container aparecerá
                            margin: EdgeInsets.all(30),
                            child: Text('Carregando informações...',
                                style: TextStyle(
                                    fontSize: 16,
                                ),
                            ),
                        ) : Container(),        // se 'loading' for false aparecerá o container vazio

                        loading ? CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        ) : Container(),
                        
                        !loading ? Container(       // se 'loading' estiver false mostra o botão
                            margin: EdgeInsets.all(30),
                            child: ElevatedButton(
                                child: Text('Tentar novamente'),
                                onPressed: (){},
                            )
                        ) : Container(),
                    ],
                )
            )
        );
    }
} 