import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // importando pacote 'services'
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class PreloadPage extends StatefulWidget {
@override
_PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
    bool loading = true;

    void requestInfo() async {      // função que fará a requisição
        await Future.delayed(Duration(seconds: 1)); // retardando a requisição por 1 segundo

        setState(() {
            loading = true;
        });

        bool req = await Provider.of<AppData>(context).requestData();

        if (req) {
            Navigator.pushReplacementNamed(context, '/home');
        } else {
            setState(() {
                loading = false;
            });
        }

    }

    // @override
    void initState() {
        super.initState();

        requestInfo();
    }

    @override
    Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

        return Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Image.asset('lib/assets/mundo.jfif',
                            width: 200,                
                        ),

                        loading ? Container(        // se 'loading' for 'true' aparecerá as informações abaixo
                            margin: EdgeInsets.all(30),
                            child: Text('Carregando informações...',
                                style: TextStyle(
                                    fontSize: 16,
                                ),
                            ),
                        ) : Container(),        // se for 'false' aparecerá um container vazio ou seja não irá aparecer nada
                        
                        loading ? CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        ) : Container(),
                        
                        !loading ? Container(
                            margin: EdgeInsets.all(30),
                            child: ElevatedButton(
                            child: Text('Tentar novamente'),
                            onPressed: () {
                                requestInfo();
                            },
                            )
                        ) : Container(),
                    ],
                ),
            ),
        );
    }
}