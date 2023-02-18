
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:provider/provider.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/pages/home.dart';
//import 'package:weather/providers/weather_providor.dart';
import 'package:weather/service/weather_service.dart';

class Search extends StatelessWidget {
  String ? city ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: TextField(
          onChanged: (data){
            city=data;
          },
          onSubmitted: (data) async{
           city=  data;
           BlocProvider.of<WeatherCubit>(context).cityName=city;
           BlocProvider.of<WeatherCubit>(context).getWeather(cityName:city!);

           Navigator.pop(context);
          },

          decoration:  InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 32 ,horizontal: 24),
            hintText: 'Enter City',
            labelText: 'Enter city',
            suffixIcon: GestureDetector(
              onTap: ()async
              {
                WeatherService service = WeatherService();
                WeatherModels ?weather =await service.getWeather(cityName: city!);

                BlocProvider.of<WeatherCubit>(context).weatherModels=weather;
                BlocProvider.of<WeatherCubit>(context).cityName=city;

                Navigator.pop(context);
              },
                child: Icon(Icons.search)),
            border: OutlineInputBorder(
              borderRadius : BorderRadius.all(Radius.circular(4.0)),
            )
          ),
        ),
      ),
    );
  }
}
