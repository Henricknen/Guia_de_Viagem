import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;        // puxando o pacote http

class AppData with ChangeNotifier {
    var data = [];      // array 'data' que conterá as informações

    void setData(newData) {     // 'setData' reçebe 'newData' os novos dados e tem a possibilidade de alterar esse novos dados recebidos
        data = newData;
        notifyListeners();
    }

    Future<bool> requestData() async{      // função assicrona 
        final res = await http.get(Uri.parse('https://restcountries.com/v3.1/all/'));      // fazendo 'requizição' da api

        if(res.statusCode == 200) {
            // inserção dos dados em DATA
            print( res.body );
            // setData( res.body );
            return true;
        } else {
            return false;
        }
    }
}