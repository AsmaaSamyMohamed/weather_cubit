import 'dart:ui';
import 'package:flutter/material.dart';

class WeatherModels {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModels({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName
  });

  factory WeatherModels.fromjson(dynamic data){
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModels(
        date:DateTime.parse(data['location']['localtime']) ,
        temp: jsonData['avgtemp_f'],
        maxTemp: jsonData['maxtemp_f'],
        minTemp: jsonData["mintem `Q  p_f"],
        weatherStateName: jsonData['condition']['text']
    );
  }

  String getImage() {
    String weather;
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud'||
        weatherStateName == 'Sunny'
    ) {
      weather = 'assets/images/clear.png';
    }
    else if (weatherStateName == 'Snow'
        || weatherStateName == 'Sleet'
        || weatherStateName == 'Hail') {
      weather = 'assets/images/snow.png';
    }
    else if (weatherStateName == 'Light rain'
        || weatherStateName == 'Heavy rain'
        || weatherStateName == 'Showers') {
      weather = 'assets/images/rainy.png';
    }
    else if (weatherStateName == 'Heavy cloud' ||
        weatherStateName == 'Patchy rain possible'||
        weatherStateName == 'Partly cloudy'
    ) {
      weather = 'assets/images/cloudy.png';
    }
    else if (weatherStateName == 'Thunderstorm') {
      weather = 'assets/images/thunderstorm.png';
    } else {
      weather = 'assets/images/thunderstorm.png';
    }
    return weather;
  }

  MaterialColor getColor() {
   // Color weatherColor =Colors.orange;
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    }
    else if (weatherStateName == 'Snow'
        || weatherStateName == 'Sleet'
        || weatherStateName == 'Hail') {
      return Colors.yellow;
    }
    else if (weatherStateName == 'Light Rain'
        || weatherStateName == 'Heavy Rain'
        || weatherStateName == 'Showers') {
      return Colors.blue;
    }
    else if (weatherStateName == 'Heavy Cloud'||
        weatherStateName == 'Patchy rain possible'||
        weatherStateName == 'Partly cloudy') {
      return  Colors.red;
    }
    else {
      return  Colors.purple;
    }
    //return weatherColor;
  }
}


  //@override
  /*String toString(){
    var maxTemp;
    return "data :$date temp:$temp maxTemp:$maxTemp";
  }*/



