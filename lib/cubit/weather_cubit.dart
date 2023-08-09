import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/cubit/weather_state.dart';
import 'package:weather_app_new/services/weather_services.dart';

import '../model/weather_model.dart';



class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.weatherService):super(InitialState());
  String? cityName;
  WeatherModel? weatherModel;
  WeatherService  weatherService;

  void getWeather({required String cityName}) async {
    emit(LoadingWeather());
    try {

      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());

    }catch(e){
      emit(WeatherFailure());
    }
    // http://localhost:53149/#/


  }

}