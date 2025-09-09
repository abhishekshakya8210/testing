import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Api4provider with ChangeNotifier{
  List abhishek = [];
  Future<void> fatchdata()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      abhishek = data;
      notifyListeners();
    }else{
      return  null;
    }
  }
}