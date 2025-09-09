import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api5provider with ChangeNotifier{
   Map<String, dynamic>? abhishek;

  Future<void> fetchValue() async {
    try {
      final response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
          abhishek = data['data']; // 
        notifyListeners();
      } else {
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }

 
}