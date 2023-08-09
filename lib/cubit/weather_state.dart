abstract class WeatherState {

}

class InitialState extends WeatherState{

}

class LoadingWeather extends WeatherState {}
class WeatherSuccess extends WeatherState {}
class WeatherFailure extends WeatherState {}