
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:provider/provider.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/cubit/weather_state.dart';
import 'package:weather/pages/search.dart';
//import 'package:http/http.dart' as http;

import '../models/weather_models.dart';

class Home extends StatelessWidget {

  WeatherModels? weatherDate;

  @override
  Widget build(BuildContext context) {
   // weatherDate=BlocProvider.of<WeatherCubit>(context).weatherService;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder:(context){
                  return Search();
                }
            ));
          }, icon: Icon(Icons.search ,color: Colors.white,), )
        ],
        title: Text('Weather' ,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body:BlocBuilder<WeatherCubit,WeatherState>(
          builder:(context,state){
            if(state is WeatherSuccess){
              weatherDate =BlocProvider.of<WeatherCubit>(context).weatherModels;
              return Container(
                // color: weatherDate!.getColor,
                decoration: BoxDecoration(
                  gradient:LinearGradient (
                    colors: [
                      weatherDate!.getColor(),
                      weatherDate!.getColor()[300]!,
                      weatherDate!.getColor()[100]!,
                      weatherDate!.getColor()[50]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 2,),
                    Text(
                      BlocProvider.of<WeatherCubit>(context).cityName!
                      ,style: TextStyle(fontSize: 30),
                    ),
                    //Text(weatherDate!.date),
                    Text('update at :${weatherDate!.date.hour.toString()}:${weatherDate!.date.minute.toString()}'),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherDate!.getImage()),
                        Text(
                            '${weatherDate!.temp.toInt().toString()}',
                            style: TextStyle(fontSize: 32)),
                        Column(children: [
                          Text(
                              'max temp ${weatherDate!.maxTemp.toInt()}',
                              style: TextStyle(fontSize: 20)),
                          Text(
                              'min temp ${weatherDate!.minTemp.toInt()}'
                              ,style: TextStyle(fontSize: 20)
                          ),
                        ],),
                      ],),
                    Spacer(),
                    Text(
                      weatherDate!.weatherStateName
                      ,style: TextStyle(fontSize: 30),
                    ),
                    Spacer(flex: 3,),
                  ],
                ),
              );
              //succesBody(context);
            }
            else if(state is WeatherLoading){
              return Center(child:
              CircularProgressIndicator(),
              );
            }
            else if (state is WeatherFailure){
              return Center(child: Text("error in City name"),);
            }
            else{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'this is no weather 😔 start ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(' searching now 🔍',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              );
            }
          }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container succesBody(BuildContext context) {
    return Container(
              // color: weatherDate!.getColor,
              decoration: BoxDecoration(
                gradient:LinearGradient (
                  colors: [
                    weatherDate!.getColor(),
                    weatherDate!.getColor()[300]!,
                    weatherDate!.getColor()[100]!,
                    weatherDate!.getColor()[50]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 2,),
                  Text(
                    BlocProvider.of<WeatherCubit>(context).cityName!
                    ,style: TextStyle(fontSize: 30),
                  ),
                  //Text(weatherDate!.date),
                  Text('update at :${weatherDate!.date.hour.toString()}:${weatherDate!.date.minute.toString()}'),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherDate!.getImage()),
                      Text(
                          '${weatherDate!.temp.toInt().toString()}',
                          style: TextStyle(fontSize: 32)),
                      Column(children: [
                        Text(
                            'max temp ${weatherDate!.maxTemp.toInt()}',
                            style: TextStyle(fontSize: 20)),
                        Text(
                            'min temp ${weatherDate!.minTemp.toInt()}'
                            ,style: TextStyle(fontSize: 20)
                        ),
                      ],),
                    ],),
                  Spacer(),
                  Text(
                    weatherDate!.weatherStateName
                    ,style: TextStyle(fontSize: 30),
                  ),
                  Spacer(flex: 3,),
                ],
              ),
            );
  }
}
