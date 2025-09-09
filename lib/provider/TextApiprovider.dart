import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Textapiprovider with ChangeNotifier {
  List<dynamic> abhishek = [];

  Future<void> abhishekapi() async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        abhishek = decoded['data']; // ✅ extract only the "data" list
        notifyListeners(); // ✅ update UI
      } else {
        print('❌ Data fetching error: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Exception: $e');
    }
  }
}
