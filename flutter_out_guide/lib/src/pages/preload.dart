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

    void requestInfo() async {
        await Future.delayed(Duration(seconds: 1)); // retardando a requisição por 1 segundo

        setState(() {
        loading = true;
        });

        bool req = await Provider.of<AppData>(context, listen: false).requestData();

        if (req) {
        // ir para home
        print("Deu certo...");
        } else {
        print("Não deu certo...");
        }

        setState(() {
        loading = false;
        });
    }

    @override
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
                Image.asset(
                'lib/assets/mundo.jfif',
                width: 200,
                ),
                loading
                    ? Container(
                        margin: EdgeInsets.all(30),
                        child: Text(
                        'Carregando informações...',
                        style: TextStyle(
                            fontSize: 16,
                        ),
                        ),
                    )
                    : Container(),
                loading
                    ? CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    )
                    : Container(),
                !loading
                    ? Container(
                        margin: EdgeInsets.all(30),
                        child: ElevatedButton(
                        child: Text('Tentar novamente'),
                        onPressed: () {
                            requestInfo();
                        },
                        ),
                    )
                    : Container(),
            ],
            ),
        ),
        );
    }
    }
