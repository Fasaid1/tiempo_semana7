import 'dart:convert'; 
import 'package:http/http.dart' as http; 
import 'weather.dart';

class WeatherService {
  final String _apiKey = '73d796bbf84b0e0cb988b8cb4d3c16be'; //api desde la escuelita
 final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather'; 

  
  Future<Weather> getWeather(String city) async {
  
   final response = await http.get(  Uri.parse('$_baseUrl?q=$city&appid=$_apiKey&units=metric'),
);

    
    if (response.statusCode == 200) {
     
      return Weather.fromJson(json.decode(response.body));
    } else {
      
      throw Exception('Error al obtener los datos meteorológicos');
    }
  }
}
