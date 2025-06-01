import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import 'weather_provider.dart'; 


class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pronóstico del Tiempo')), 
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            const Text('Ciudad:'), 
            TextField(
              
              onSubmitted: (city) {
                
                Provider.of<WeatherProvider>(context, listen: false)
                    .fetchWeather(city); 
              },
            ),
            const SizedBox(height: 20), 
            Consumer<WeatherProvider>( 
              builder: (context, weatherProvider, child) {
                if (weatherProvider.isLoading) {
                 
                  return const Center(child: CircularProgressIndicator()); 
                } else if (weatherProvider.weather == null) {
              
                  return const Center(child: Text('No se encontraron datos.')); 
                } else {
                 
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Row(
                        children: [
                          const Icon(Icons.cloud),
                          const SizedBox(width: 8),
                          Text(
                            'Temperatura: ${weatherProvider.weather!.temperature}°C',
                            style:const TextStyle(fontSize: 16), 
                          ),
                        ],
                      ),
                        Row(
                        children: [
                          const Icon(Icons.air),
                          const SizedBox(width: 8),
                          Text('Velocidad del viento: ${weatherProvider.weather!.windSpeed} m/s'),
                        ],
                      ),

                                            Row(
                        children: [
                          const Icon(Icons.cloud, size: 30.0),
                          const SizedBox(width: 8),
                         Text('Humedad: ${weatherProvider.weather!.humidity}%'),
                        ],
                      ),
                        Row(
                        children: [
                          const Icon(Icons.device_hub),
                          const SizedBox(width: 8),
                          Text('Presión: ${weatherProvider.weather!.pressure} hPa'),
                        ],
                      ),
                      
                      
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
