import 'package:flutter/foundation.dart';
import 'weather.dart'; 
import 'weather_service.dart'; 


class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false; 

  
  Weather? get weather => _weather;

  
  bool get isLoading => _isLoading;

 
  Future<void> fetchWeather(String city) async {
    _isLoading = true; 
    notifyListeners(); 

    try {
      
      _weather = await WeatherService().getWeather(city);
    } catch (e) {
      
      _weather = null;
      if (kDebugMode) {
        print('Error: $e');
      } 
    }

    _isLoading = false; 
    notifyListeners(); 
  }
}
