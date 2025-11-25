import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/weather_api_provider.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  void initState() {
    super.initState();
    
    Provider.of<WeatherApiProvider>(context, listen: false).wheatherapi();
  }

  @override
  Widget build(BuildContext context) {
    final weatherApiProvider = Provider.of<WeatherApiProvider>(context);

    return Scaffold(
      body: weatherApiProvider.weather == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("City: ${weatherApiProvider.weather!['name']}"),
                  Text(
                    "Temperature: ${(weatherApiProvider.weather!['main']['temp'] - 273.15).toStringAsFixed(1)} °C",
                  ),
                  Text("Weather: ${weatherApiProvider.weather!['weather'][0]['main']}"),
                  Text("Description: ${weatherApiProvider.weather!['weather'][0]['description']}"),
                ],
              ),
            ),
    );
  }
}
