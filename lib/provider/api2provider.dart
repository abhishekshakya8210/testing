import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api2provider with ChangeNotifier{
    List<dynamic> abhishek = [];
   Future<void> abhishekapi()async{
   var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      abhishek = data;
      notifyListeners();
    }else{
      return null;
    }
  }

}