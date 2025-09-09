import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api1provider with ChangeNotifier {
  List<dynamic> abhishek = [];

  // API call method
  Future<void> fetchData() async {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    if (response.statusCode == 200) {
      abhishek = jsonDecode(response.body.toString());
      notifyListeners(); // refresh UI
    } else {
      throw Exception("Failed to load data");
    }
  }
}
