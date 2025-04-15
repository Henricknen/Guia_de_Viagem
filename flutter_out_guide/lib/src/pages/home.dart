import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(     // cabeçalho
                backgroundColor: Color(0xFF2E8BF1),
                title: Text('Home'),
            ),
            body: Center(       // corpo
                child: Text('Teste'),
            ),
        );
    }
}