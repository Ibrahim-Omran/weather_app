import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/cubit/weather_cubit.dart';
import 'package:weather_app_new/screens/home_screen.dart';
import 'package:weather_app_new/services/weather_services.dart';

void main() {
  runApp(
      BlocProvider(
      create: (context)=> WeatherCubit(WeatherService()),
      child:MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Weather',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: SearchPage()
    );
  }
}