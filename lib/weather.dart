class Weather {
  final double temperature; 
  final String description; 
  final double windSpeed; 
  final double humidity;
  final double pressure;

 
  Weather({required this.temperature, required this.description, required this.windSpeed, required this.humidity, required this.pressure});


  factory Weather.fromJson(Map<String, dynamic> json) {
   
    return Weather(
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'], 
      windSpeed: json['wind']['speed'].toDouble(), 
      humidity: json['main']['humidity'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      
 
      

    );
  }
}
