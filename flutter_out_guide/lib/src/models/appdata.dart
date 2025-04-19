import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;        // puxando o pacote http

class AppData with ChangeNotifier {
    var data = [];      // array 'data' que conterá as informações

    void setData(newData) {     // 'setData' reçebe 'newData' os novos dados, e tem a possibilidade de alterar esse novos dados recebidos
        data = newData;
        notifyListeners();
    }

    Future<bool> requestData() async {      // função assicrona pega os dados do 'webservice' api
        final uri = Uri.parse('https://api.b7web.com.br/flutter1wb/');  // converte a URL para o tipo 'Uri'
        final res = await http.get(uri);  // agora o parâmetro é um 'Uri'

        if(res.statusCode == 200) {     // se der uma respostas satisfatória
            setData( jsonDecode(res.body) );        // inseri o dados em em 'setData'
            return true;        // e retona 'true'
        } else {
            return false;
        }
    }
}