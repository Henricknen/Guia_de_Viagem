import 'package:flutter/material.dart';

class PreloadPage extends StatefulWidget {
    @override
    _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
    bool loading = false;

    @override
    Widget build(BuildContext contex) {
        return Scaffold(
            body:Center(
                child: Column(
                    mainAxisAlingment: MainAxisAlingment.center,
                    children: <Widget>[
                        Image.asset('lib/assets/mundo.jfif',
                            width: 200,
                        )
                    ],
                )
            )
        );
    }
}