import 'dart:convert';

import 'package:Temfer/constants/api_data.dart';
import 'package:Temfer/models/weather_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  Future<WeatherData> fetchWeather() async {
    // Get current location
    Position position;
    position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    // Find last known location if cant find the current location
    if (position == null) {
      position = await getLastKnownPosition(forceAndroidLocationManager: true);
    }

    // Get call
    final response = await http.get(
        '${ApiData.weatherBaseApi}?lat=${position.latitude}&lon=${position.longitude}&appid=${ApiData.apiKey}');
    if (response.statusCode == 200) {
      print(response.body);
      // Api returns data
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
