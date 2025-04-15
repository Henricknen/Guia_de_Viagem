import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
    var data = [];      // array 'data' que conterá as informações

    void setData(newData) {     // 'setData' reçebe 'newData' os novos dados e tem a possibilidade de alterar esse novos dados recebidos
        data = newData;
        notifyListeners();
    }
}