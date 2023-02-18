import 'dart:convert';
import 'package:weather/models/weather_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherService{

  String baseUrl= 'http://api.weatherapi.com/v1';
  String apiKey ='69e08e2989504d02ab113252220310';

  Future<WeatherModels?> getWeather({required String cityName}) async {
    WeatherModels? weater;

   try{
     Uri url = Uri.parse(
         '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
     http.Response response= await http.get(url);
     Map<String ,dynamic> data=jsonDecode(response.body);

      weater =WeatherModels.fromjson(data);
   }catch(e){
     print(e);
   }
   return weater;

  }
}