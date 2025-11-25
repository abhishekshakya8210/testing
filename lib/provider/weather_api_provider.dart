import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class WeatherApiProvider with ChangeNotifier{
  Map<String ,dynamic>? weather;
  Future<void> wheatherapi()async{
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=farrukhabad&appid=d7a911cbdea4de965b55aba52e3e3f6e'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      
        weather = data;
        notifyListeners();
    
    }else{
      return null;
    }
  }
}