import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_state.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/service/weather_service.dart';


class WeatherCubit extends Cubit<WeatherState>{

  WeatherService weatherService;
  String? cityName;
  WeatherModels? weatherModels;

  WeatherCubit( this.weatherService):super(WeatherInitial());

  void getWeather({required String cityName}) async{
  emit(WeatherLoading());
    try{
    weatherModels= await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    }on Exception catch(e){
      emit(WeatherFailure());
    }
   //emit(WeatherSuccess());
  }
}