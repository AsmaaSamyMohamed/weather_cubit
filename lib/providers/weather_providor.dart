import 'package:flutter/material.dart';
import 'package:weather/models/weather_models.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModels? _weatherDate;
  String ? cityName;
  set weatherDate(WeatherModels? weather){
    _weatherDate =weather;
    notifyListeners();
  }
  WeatherModels? get weatherDate =>_weatherDate;
}