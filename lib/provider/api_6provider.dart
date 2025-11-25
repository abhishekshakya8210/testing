import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api6provider with ChangeNotifier{
    List<dynamic>? abhishek; 
  bool isLoading = true;  
  String? errorMessage;    

  Future<void> fatchingdata() async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/unknown'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        
          abhishek = data['data'];
          isLoading = false;
          notifyListeners();
        
      } else {
        
          errorMessage = "Failed to load data (Status: ${response.statusCode})";
          isLoading = false;
      
      }
    } catch (e) {
      
        errorMessage = "Error: $e";
        isLoading = false;
    
    }
  }


}