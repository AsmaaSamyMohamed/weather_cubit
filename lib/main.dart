import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_providor.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:weather/service/weather_service.dart';
import 'dart:ui';

void main() {
  runApp( BlocProvider(
      create:(context){
        return WeatherCubit(WeatherService());
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  WeatherModels ? weather;
  MaterialColor color =Colors.cyan;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      /*primarySwatch ://color
        BlocProvider.of<WeatherCubit>(context).weatherModels == null?
        color :
      BlocProvider.of<WeatherCubit>(context).weatherModels!.getColor(),*/
      ),
      home: Home(),

    );
  }
}

