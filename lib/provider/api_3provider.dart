import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api3provider  with ChangeNotifier{

  List abhishek  = [];
  Future<void> fatch()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
    
        abhishek = data;
     notifyListeners();
    } else{
      return null;
    }
  }


}